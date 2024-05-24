import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prism_test/widgets/appbar_main.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary'),
      ),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80), // 위쪽 여백 추가
              const Text(
                '안녕하세요 \nUser님',
                style: TextStyle(fontSize: 39, color: Colors.white),
              ),
              const SizedBox(height: 130),
              const Text(
                '오늘의 기록',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: MainAppBar(),
        ),
      ]),
    );
  }
}
