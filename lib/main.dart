import 'package:flutter/material.dart';
import 'gradient_container.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          child: StartScreen(),
        ),
      ),
    ),
  );
}