import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class PhraseListScreen extends StatefulWidget {
  final int id;
  PhraseListScreen({
    required this.id
});
  @override
  State<PhraseListScreen> createState() => _PhraseListScreenState();
}


class _PhraseListScreenState extends State<PhraseListScreen> {
  final categoryController = Get.find<CategoryController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoryController.fetchPhrasesForCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phrases: ${widget.id}'),
      ),
      body: Obx(() {
        if (categoryController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // here actually map the data base on id...........
        final filteredPhrases = categoryController.phrases
            .where((phrase) => phrase.categoryID == widget.id)
            .toList();

        if (filteredPhrases.isEmpty) {
          return Center(child: Text('No phrases found.'));
        }

        return ListView.builder(
          itemCount: filteredPhrases.length,
          itemBuilder: (context, index) {
            final phrase = filteredPhrases[index];

            final selectedLanguage1Key = categoryController.selectedLanguage1;
            final selectedLanguage2Key = categoryController.selectedLanguage2;

            final phraseText1 = phrase.toMap()[selectedLanguage1Key] ?? 'Unknown';
            final phraseText2 = phrase.toMap()[selectedLanguage2Key] ?? '';

            return ListTile(
              title: Text(phraseText1),
              subtitle: Text(phraseText2),
            );
          },
        );
      }),
    );
  }
}
