import 'package:flutter/material.dart';
import 'package:capstone/widgets/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 92, 148, 207),
      ),
      home: const StartScreen(),
    ),
  );
}
