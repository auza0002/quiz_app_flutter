import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.questionsSummary});
  final List<Map<String, Object>> questionsSummary;

  bool getColorsByAnswer(String answer, String userAnwer) {
    var result = false;
    if (answer == userAnwer) {
      result = true;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(136, 0, 0, 0),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: questionsSummary.map(
              (item) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: getColorsByAnswer(
                                  item['correnct_anwer'] as String,
                                  item['user_answer'] as String)
                              ? Colors.blue
                              : Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            ((item['question_index'] as int) + 1).toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Expanded(
                          child: Column(
                            children: [
                              Text(
                                item['question'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                item['user_answer'] as String,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                item['correnct_anwer'] as String,
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
