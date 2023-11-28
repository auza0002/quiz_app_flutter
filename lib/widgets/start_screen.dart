import 'package:flutter/material.dart';

import 'package:quiz_app/widgets/quiz.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Image.asset(
              // there is always a better way to do the opacticy
              "assets/images/quiz-logo.png",
              width: 250,
              color: const Color.fromARGB(130, 255, 255, 255),
              // how to make the img tranparent
            ),
          ),
          // Opacity(
          //   opacity: 0.8,
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 30),
          //     child: Image.asset(
          //       "assets/images/quiz-logo.png",
          //       width: 250,
          //       // how to make the img tranparent
          //     ),
          //   ),
          // ),
          const Text(
            "Learn Flutter the fun way",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),

          ElevatedButton.icon(
            onPressed: () {
              // here goes the function
            },
            icon: const Icon(Icons.question_mark),
            label: const Text("Get started"),
          ),
        ],
      ),
    );
  }
}
