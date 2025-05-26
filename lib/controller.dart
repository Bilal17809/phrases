import 'package:get/get.dart';
import 'database_hp.dart';
import 'model.dart';

class CategoryController extends GetxController {
  var category = <PhrasesCategoryModel>[].obs;
  var phrases = <Phrases>[].obs;

  var isLoading = false.obs;

  late String selectedLanguage1 = 'English';
  late String selectedLanguage2 = 'Afrikaans';
  late List<String> filteredSentences = [];
  late List<Map<String, dynamic>> allCategories = [];
  late List<String> languageKeys = [];

  bool isDataInitialized = false;
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      // Fetch all categories
      final List<PhrasesCategoryModel> result = await DatabaseHelper().fetchAllCategories();

      if (result.isNotEmpty) {
        category.addAll(result); // Add all the results to the observable list
        _initializeData(); // Initialize data once categories are fetched
        print("Fetched Categories: ${result.length}");
      } else {
        print("No categories found.");
      }
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchPhrasesForCategory() async {
    try {
      isLoading.value = true;
      final List<Phrases> result = await DatabaseHelper().fetchPhrasesByCategory();

      if (result.isNotEmpty) {
        final filteredPhrases = result.where((phrase) {
          final phraseMap = phrase.toMap();
          final languageKey1 = selectedLanguage1;
          final languageKey2 = selectedLanguage2;

          return (phraseMap[languageKey1]?.isNotEmpty ?? false) ||
              (phraseMap[languageKey2]?.isNotEmpty ?? false);
        }).toList();

        phrases.assignAll(filteredPhrases);
        print("Filtered Phrases: ${filteredPhrases.length}");
      } else {
        phrases.clear();
        print("No phrases found.");
      }
    } catch (e) {
      print("Error fetching phrases: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void _initializeData() {
    if (category.isNotEmpty && !isDataInitialized) {
      allCategories = category.map((cat) => cat.toMap()).toList();
      languageKeys = allCategories.isNotEmpty ? allCategories.first.keys.toList() : [];
      if (languageKeys.isNotEmpty) {
        // selectedLanguage1 = languageKeys.first;
        // selectedLanguage2 = languageKeys.first;
        _updateFilteredSentences(selectedLanguage1);
      }
      isDataInitialized = true;
    }
  }

  void _updateFilteredSentences(String language) {
    filteredSentences = allCategories
        .map((category) => category[language]?.toString() ?? '')
        .where((sentence) => sentence.isNotEmpty)
        .toList();
  }

  // Change language and update filtered sentences
  void changeLanguage1(String language) {
    selectedLanguage1 = language;
    _updateFilteredSentences(selectedLanguage1);
  }

  void changeLanguage2(String language) {
    selectedLanguage2 = language;
  }

  // Filter sentences based on search query
  void filterSentences(String query) {
    filteredSentences = allCategories
        .map((category) => category[selectedLanguage1]?.toString() ?? '')
        .where((sentence) => sentence.isNotEmpty && sentence.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}