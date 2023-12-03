import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var currentQuestionindex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestionindex];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
              color: const Color.fromARGB(136, 0, 0, 0),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              currentQuestions.text,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestions.getShuffledAnswers().map((answer) {
            return Answerbutton(
              value: answer,
              callBack: () {
                answerQuestion(answer);
              },
            );
          }),
        ],
      ),
    );
  }
}
