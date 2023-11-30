import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  void answerQuestion() {
    setState(() {
      currentQuestionindex++;
    });
  }

  var currentQuestionindex = 0;
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
            return (Answerbutton(value: answer, callBack: answerQuestion));
          }),
        ],
      ),
    );
  }
}
