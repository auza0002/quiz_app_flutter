import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart' as question_array;
import 'package:quiz_app/widgets/questions_screen.dart';
import 'package:quiz_app/widgets/result_screen.dart';
import 'package:quiz_app/widgets/start_screen.dart';
import 'dart:math' as math;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => QuizState();
}

class QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  static String activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == question_array.questions.length - 2) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
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
    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        switchscreen: switchScreen,
        result: selectedAnswers,
      );
    }
    if (activeScreen == "questions-screen") {
      screenWidget = Questions(
        onSelectedAnswer: chooseAnswer,
      );
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
