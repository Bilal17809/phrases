import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();

  static init() async {
    await _notification.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        ));
    tz.initializeTimeZones();
  }
  static scheduleNotification2(
      String title,
      String body,
      int userDayInput,
      ) async {
    var androidDetails = const AndroidNotificationDetails(
      "important_notification",
      "My Channel",
      importance: Importance.max,
      priority: Priority.high,
    );
    var notificationDetails = NotificationDetails(android: androidDetails);
    await _notification.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(
        seconds: userDayInput,
      )

      ),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
  static cancelNotification(int prayerId) async {
    await _notification.cancel(prayerId); // Cancel specific notification
  }
}

class NotificationScreen extends StatefulWidget {
  final String prayerName;
  final String prayerTime;
  final int index;
  const NotificationScreen({super.key,
    required this.prayerName,
    required this.prayerTime,
    required this.index,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}
class _NotificationScreenState extends State<NotificationScreen> {
  bool _notificationEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadNotificationState();
  }

  int getPrayerId() {
    return widget.prayerName.hashCode;
  }

  void _loadNotificationState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationEnabled = prefs.getBool('notification_enabled_${widget.prayerName}') ?? false;
    });

    if (_notificationEnabled) {
      NotificationHelper.scheduleNotification2(
        "Prayer Reminder",
        "Time for",
        2
      );
    }
  }

  void _saveNotificationState(bool enabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notification_enabled_${widget.prayerName}', enabled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Allow Notifications for ${widget.prayerName} at ${widget.prayerTime}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Switch(
              value: _notificationEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationEnabled = value;
                });

                _saveNotificationState(value);

                if (value) {
                  NotificationHelper.scheduleNotification2(
                    "Prayer Reminder",
                    "Time for ${widget.prayerName}", 2,
                  );
                } else {
                  NotificationHelper.cancelNotification(getPrayerId());
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _notificationEnabled = false;
                });
                _saveNotificationState(false);
                NotificationHelper.cancelNotification(getPrayerId());
              },
              child: const Text("Remove Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
