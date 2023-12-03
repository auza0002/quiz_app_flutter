import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.result, required this.switchscreen});
  final List<String> result;
  final void Function() switchscreen;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < result.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correnct_anwer': questions[i].answers[0],
          'user_answer': result[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberTotalQuestions = questions.length;
    final numberTotalAnswer = summaryData.where((data) {
      return data['user_answer'] == data['correnct_anwer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(136, 0, 0, 0),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              "You answer $numberTotalAnswer out of $numberTotalQuestions correctly!",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(questionsSummary: summaryData),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: switchscreen,
            icon: const Icon(Icons.restart_alt_rounded),
            label: const Text("Restart Quiz"),
          ),
        ],
      ),
    );
  }
}
