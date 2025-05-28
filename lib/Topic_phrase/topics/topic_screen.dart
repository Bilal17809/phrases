import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
// class TopicListScreen extends StatelessWidget {
//   final TopicController topicController = Get.put(TopicController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(title: Text('Topic Phrases')),
//       body: Obx(() {
//         if (topicController.topicList.isEmpty) {
//           return Center(child: Text('No data available.'));
//         }
//         return AnimationLimiter(
//           child: ListView.builder(
//             itemCount: topicController.topicList.length,
//             itemBuilder: (context, index) {
//               final topic = topicController.topicList[index];
//               return AnimationConfiguration.staggeredList(
//                 position: index,
//                 duration: const Duration(milliseconds: 375),
//                 child: SlideAnimation(
//                   verticalOffset: 50.0,
//                   child: FadeInAnimation(
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Neumorphic(
//                         style: NeumorphicStyle(
//                           depth: 4,
//                           intensity: 0.8,
//                           shape: NeumorphicShape.flat,
//                           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//                           color: Colors.white,
//                         ),
//                         child: ListTile(
//                           contentPadding: EdgeInsets.all(16),
//                           title: Text(topic.title ?? 'No title',),
//                           subtitle: Text(topic.desc ?? 'No description'),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Phrases(id: topic.id),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       }),
//     );
//   }
// }

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
