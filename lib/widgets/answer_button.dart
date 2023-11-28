import 'package:flutter/material.dart';

class Answerbutton extends StatelessWidget {
  const Answerbutton({
    super.key,
    required this.value,
    required this.result,
    required this.callBack,
  });
  final String value;
  final bool result;
  final void Function() callBack;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {},
      child: Text(value),
    );
  }
}
