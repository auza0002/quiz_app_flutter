import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/gradient_container.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientContainer(),
      ),
    );
  }
}
