import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/widgets/questions_screen.dart';
import 'package:quiz_app/widgets/start_screen.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => QuizState();
}

class QuizState extends State<Quiz> {
  var activeScreen = "start-screen";

  void switchScreen() async {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  Color _colorTop = Colors.red;
  Color _colorBottom = Colors.blue;
  Color getColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }

  void changeColor() {
    setState(() {
      _colorTop = getColor();
      _colorBottom = getColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(startQuiz: switchScreen);
    if (activeScreen == "questions-screen") {
      screenWidget = const Questions();
    }

    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.tiltWarp().fontFamily,
      ),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "My Quiz App",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: const Color.fromARGB(25, 0, 0, 0),
          elevation: 0,
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: changeColor,
              icon: const Icon(Icons.color_lens),
            ),
          ],
        ),
        body: AnimatedContainer(
          duration: const Duration(seconds: 1),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_colorTop, _colorBottom],
            ),
          ),
          child: SafeArea(
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
