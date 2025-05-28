import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class WorsScreen extends StatelessWidget {
  final WordController topicController = Get.put(WordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Topic Phrases')),
      body: Obx(() {
        if (topicController.wordList.isEmpty) {
          return Center(child: Text('No data available.'));
        }
        return ListView.builder(
          itemCount: topicController.wordList.length,
          itemBuilder: (context, index) {
            final topic = topicController.wordList[index];
            return ListTile(
              title: Text(topic.keyword ?? 'no word'),
              subtitle: Text(topic.example ?? 'No description'),
              onTap:(){
                // Navigator.push(context,MaterialPageRoute(builder: (context)=>
                //     Phrases(id: topic.id,)));
              },
            );
          },
        );
      }),
    );
  }
}

