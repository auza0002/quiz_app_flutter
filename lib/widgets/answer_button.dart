import 'package:flutter/material.dart';

class Answerbutton extends StatelessWidget {
  const Answerbutton({
    super.key,
    required this.value,
    required this.callBack,
  });
  final String value;
  final void Function() callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: callBack,
        child: SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              value,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
