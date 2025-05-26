import 'package:get/get.dart';

import '../Topic_phrase/db/db_services.dart';
import '../Topic_phrase/model/models.dart';

class TopicController extends GetxController {
  var topicList = <Words>[].obs;
  var phrasesList = <Words>[].obs;
  final dbHelper = DatabaseDServices();

  @override
  void onInit() {
    super.onInit();
    loadTopics();
  }

  void loadTopics() async {
    try {
      final topics = await dbHelper.fetchTopics();
    } catch (e) {
      print("Error loading topics: $e");
    }
  }


  void loadPhrases(int ids) async {
    try {
      final topics = await dbHelper.fetchPhraseByTopic(ids);
    } catch (e) {
      print("Error loading phrases: $e");
    }
  }
}
