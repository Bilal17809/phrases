import 'package:flutter/material.dart';
class AnimatedCardScreen extends StatefulWidget {
  @override
  _AnimatedCardScreenState createState() => _AnimatedCardScreenState();
}

class _AnimatedCardScreenState extends State<AnimatedCardScreen>
    with TickerProviderStateMixin {
  final int cardCount = 20;
  late List<AnimationController> controllers;
  late List<Animation<Offset>> slideAnimations;
  late List<Animation<double>> fadeAnimations;
  int visibleCards = 0;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(cardCount, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      );
    });

    slideAnimations = List.generate(cardCount, (index) {
      return Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: controllers[index],
        curve: Curves.easeOut,
      ));
    });

    fadeAnimations = List.generate(cardCount, (index) {
      return Tween<double>(
        begin: 0,
        end: 1,
      ).animate(CurvedAnimation(
        parent: controllers[index],
        curve: Curves.easeIn,
      ));
    });

    playAnimationsSequentially(0);
  }

  void playAnimationsSequentially(int index) async {
    if (index >= cardCount) return;

    await Future.delayed(const Duration(milliseconds: 50));

    setState(() {
      visibleCards++;
    });

    await controllers[index].forward();

    playAnimationsSequentially(index + 1);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards Slide from Bottom')),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(visibleCards, (index) {
            return FadeTransition(
              opacity: fadeAnimations[index],
              child: SlideTransition(
                position: slideAnimations[index],
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4,
                  child: ListTile(
                    title: Text('Card ${index + 1}'),
                    subtitle: const Text('Smoothly slides from bottom'),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}





