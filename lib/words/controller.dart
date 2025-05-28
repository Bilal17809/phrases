import 'package:get/get.dart';

import '../Topic_phrase/db/db_services.dart';
import '../Topic_phrase/model/models.dart';

class WordController extends GetxController {
  var wordList = <Words>[].obs;
  final dbHelper = DatabaseDServices();

  @override
  void onInit() {
    super.onInit();
    loadWords();
  }
  void loadWords() async {
    try {
      final words = await dbHelper.fetchWord();
      wordList.value = words; // ✅ Assign to the observable
    } catch (e) {
      print("Error loading words: $e");
    }
  }

  // void loadWords() async {
  //   try {
  //     final wordList = await dbHelper.fetchWord();
  //   } catch (e) {
  //     print("Error loading words: $e");
  //   }
  // }
}
