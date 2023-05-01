import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Random random = Random();
  int currentImageIndex = 0;
  int counter = 1;
  List<String> images = [
    'assets/dice1.png',
    'assets/dice2.png',
    'assets/dice3.png',
    'assets/dice4.png',
    'assets/dice5.png',
    'assets/dice6.png',
  ];
  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Roll'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.rotate(
            angle: random.nextDouble() * 180,
            child: Image.asset(
              images[currentImageIndex],
              height: 100,
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () async {
              // Rolling the dice

              // Sound
              await player.setAsset('assets/dice_roll.mp3');
              player.play();

              // Roll the dice
              Timer.periodic(const Duration(milliseconds: 80), (timer) {
                counter++;
                setState(() {
                  currentImageIndex = random.nextInt(6);
                });

                if (counter >= 13) {
                  timer.cancel();

                  setState(() {
                    counter = 1;
                  });
                }
              });
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Roll',
                style: TextStyle(fontSize: 26),
              ),
            ),
          )
        ],
      )),
    ); 
  }
}
