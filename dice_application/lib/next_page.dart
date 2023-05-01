import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int leftdice = 1;
  int rightdice = 2;

  rolldices() {
    setState(() {
      leftdice = Random().nextInt(6) + 1;
      rightdice = Random().nextInt(6) + 1;
    });
  }

  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Dice Application',
          style: GoogleFonts.lobster(fontSize: 24),
        ),
      ),
      backgroundColor: Colors.white, // set background color
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Image.asset('assets/dice.png'),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Image.asset('assets/$leftdice.png'),
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Image.asset('assets/$rightdice.png'),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              rolldices();
              await player.setAsset('assets/dice_roll.mp3');
              player.play();
            },
            child: Text(
              'Roll Dices',
              style: GoogleFonts.lobster(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
