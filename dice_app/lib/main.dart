import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'My Dice Application',
          style: GoogleFonts.lobster(fontSize: 24),
        ),
        backgroundColor: Colors.red,
      ),
      body: DiceGame(),
    ),
  ));
}

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int leftdice = 1;
  int rightdice = 2;
  AudioCache audioCache = AudioCache();

  void initState() {
    super.initState();
    audioCache.load('dice_roll.mp3');
  }

  void playSound() async {
    audioCache.play('dice_roll.mp3');
  }

  rolldices() {
    playSound();
    setState(() {
      leftdice = Random().nextInt(6) + 1;
      rightdice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                padding: EdgeInsets.only(left: 30.0),
                child: Image.asset('assets/$leftdice.png'),
              ),
            ),
            SizedBox(width: 2.0), // Add SizedBox with desired width for spacing
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 30.0),
                child: Image.asset('assets/$rightdice.png'),
              ),
            ),
          ],
        )),
        ElevatedButton(
          onPressed: () {
            rolldices();
          },
          child: Text(
            'Roll Dices',
            style: GoogleFonts.lobster(fontSize: 20),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
