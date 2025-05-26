import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phrases/Topic_phrase/topics/topic_contr.dart';

class TopicListScreen extends StatelessWidget {
  final TopicController topicController = Get.put(TopicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Topic Phrases')),
      body: Obx(() {
        if (topicController.topicList.isEmpty) {
          return Center(child: Text('No data available.'));
        }
        return ListView.builder(
          itemCount: topicController.topicList.length,
          itemBuilder: (context, index) {
            final topic = topicController.topicList[index];
            return ListTile(
              title: Text(topic.title ?? 'No title'),
              subtitle: Text(topic.desc ?? 'No description'),
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>
                    Phrases(id: topic.id,)));
              },
            );
          },
        );
      }),
    );
  }
}


class Phrases extends StatefulWidget {
  final int id;
  const Phrases({
    required this.id
  });
  @override
  State<Phrases> createState() => _PhrasesState();
}

class _PhrasesState extends State<Phrases> {
  final TopicController topicController = Get.put(TopicController());
  @override
  void initState() {
    super.initState();
    topicController.loadPhrases(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Topic Phrases')),
      body: Obx(() {
        if (topicController.topicList.isEmpty) {
          return Center(child: Text('No data available.'));
        }
        return ListView.builder(
          itemCount: topicController.phrasesList.length,
          itemBuilder: (context, index) {
            final topic = topicController.phrasesList[index];
            return ListTile(
              title: Text(topic.explain ?? 'No title'),
              subtitle: Text(topic.sentence ?? 'No description'),
              onTap:(){
                // Navigator.push(context,MaterialPageRoute(builder: (context)=>
                //     Phrases()));
              },
            );
          },
        );
      }),
    );
  }
}
