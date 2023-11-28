import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/start_screen.dart';
import 'dart:math' as math;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => QuizState();
}

class QuizState extends State<Quiz> {
  var activeScreen = const StartScreen();

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
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            "My Quiz App",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
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
          child: const SafeArea(
            child: StartScreen(),
          ),
        ),
      ),
    );
  }
}
