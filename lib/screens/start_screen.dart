import 'package:flutter/material.dart';
import 'package:prism_test/widgets/appbar_main.dart';
import 'package:prism_test/widgets/blurred_light.dart';
import 'dart:math';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary'),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Container(
          constraints: BoxConstraints.expand(),
          child: GlowingCirclesBlur(),
        ),
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

class GlowingCirclesBlur extends StatefulWidget {
  @override
  _GlowingCirclesBackgroundState createState() =>
      _GlowingCirclesBackgroundState();
}

class _GlowingCirclesBackgroundState extends State<GlowingCirclesBlur>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Circle> _circles;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat(reverse: true);
    _circles = [
      Circle(
        initialOffset: Offset(300, 200),
        motion: Offset(0, 0),
        radius: 100,
        color: Colors.white,
      ),
      Circle(
        initialOffset: Offset(370, 100),
        motion: Offset(0, 0),
        radius: 70,
        color: Colors.white,
      ),
      Circle(
        initialOffset: Offset(20, 10),
        motion: Offset(0, 0),
        radius: 100,
        color: Colors.white,
      ),
      Circle(
        initialOffset: Offset(30, 600),
        motion: Offset(0, 0),
        radius: 80,
        color: Colors.white,
      ),
      Circle(
        initialOffset: Offset(400, 720),
        motion: Offset(0, 0),
        radius: 110,
        color: Colors.white,
      ),
    ];

    _circles.forEach((circle) {
      final random = Random();
      final dx = (random.nextDouble() * 60) - 30;
      final dy = (random.nextDouble() * 60) - 30;
      circle.motion = Offset(dx, dy);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: GlowingCirclesPainter(_controller, _circles),
    );
  }
}
