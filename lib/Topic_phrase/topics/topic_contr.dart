import 'package:get/get.dart';
import '../db/db_services.dart';
import '../model/models.dart';

class TopicController extends GetxController {
  var topicList = <TopicPhrases>[].obs;
  var phrasesList = <TopicPhrasesSentence>[].obs;
  final dbHelper = DatabaseDServices();

  @override
  void onInit() {
    super.onInit();
    loadTopics();
  }

  void loadTopics() async {
    try {
      final topics = await dbHelper.fetchTopics();
      topicList.assignAll(topics);
    } catch (e) {
      print("Error loading topics: $e");
    }
  }


  void loadPhrases(int ids) async {
    try {
      final topics = await dbHelper.fetchPhraseByTopic(ids);
      phrasesList.assignAll(topics);
    } catch (e) {
      print("Error loading phrases: $e");
    }
  }
}
