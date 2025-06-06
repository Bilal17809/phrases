import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:phrases/translations/translation_view.dart';
import 'package:phrases/words/wors_screen.dart';
import 'Topic_phrase/topics/topic_screen.dart';
import 'animated_card/animated_card_screen.dart';
import 'concention_animation/animations_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home:AnimatedCardScreen(),
    );
  }
}

