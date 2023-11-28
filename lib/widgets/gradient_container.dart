import 'package:flutter/material.dart';
import 'dart:math' as math;

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key});

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
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
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [_colorTop, _colorBottom],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Image.asset(
                  "assets/images/quiz-logo.png",
                  width: 250,
                ),
              ),
              const Text(
                "Learn Flutter the fun way",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              ElevatedButton.icon(
                onPressed: changeColor,
                icon: const Icon(Icons.color_lens),
                label: const Text("change color"),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.question_mark),
                label: const Text("Get started"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
