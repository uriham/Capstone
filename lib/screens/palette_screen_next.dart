import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          physics: BouncingScrollPhysics(), // 슬라이딩 허용
          children: const [
            TestScreen("Screen 1"),
            TestScreen("Screen 2"),
            TestScreen("Screen 3"),
          ],
        ),
      ),
    );
  }
}

class TestScreen extends StatelessWidget {
  final String text;
  const TestScreen(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
