// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HadisBanner extends StatelessWidget {
  List<Map<String, dynamic>> items;
  HadisBanner({key, required this.items}) : super(key: key);
  Map<String, dynamic> getRandomItem() {
    if (items.isEmpty) return {};
    Random random = Random();
    return items[random.nextInt(items.length)];
  }

  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  final colorizeTextStyle = const TextStyle(
    fontSize: 18.0,
    fontFamily: 'Horizon',
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> item = getRandomItem();
    return Card(
      shadowColor: Colors.blue,
      elevation: 10.0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue),
        borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white38,
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      '${item['title'] ?? ''} ${item['subtitle'] ?? ''} ${item['hawala'] ?? ''}',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    debugPrint("Tap Event");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
