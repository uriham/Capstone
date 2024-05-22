import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: GlowingCirclesBackground(),
  ));
}

class GlowingCirclesBackground extends StatefulWidget {
  @override
  _GlowingCirclesBackgroundState createState() =>
      _GlowingCirclesBackgroundState();
}

class _GlowingCirclesBackgroundState extends State<GlowingCirclesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Circle> _circles;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 7))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _updateCircles();
              _controller.forward(from: 0.0);
            }
          });
    _circles = List.generate(5, (index) => Circle());
    _controller.forward();
  }

  void _updateCircles() {
    setState(() {
      _circles = List.generate(5, (index) => Circle());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: GlowingCirclesPainter(_controller, _circles),
          ),
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '안녕하세요\nUser님',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GlowingCirclesPainter extends CustomPainter {
  final AnimationController animation;
  final List<Circle> circles;
  final Paint circlePaint;

  GlowingCirclesPainter(this.animation, this.circles)
      : circlePaint = Paint()..style = PaintingStyle.fill,
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final double progress = animation.value;

    for (var circle in circles) {
      final double offsetX =
          circle.initialOffset.dx + progress * circle.motion.dx;
      final double offsetY =
          circle.initialOffset.dy + progress * circle.motion.dy;

      final Offset offset = Offset(offsetX, offsetY);

      circlePaint.color =
          circle.color.withOpacity(0.3 + 0.7 * (1.0 - progress));

      canvas.drawCircle(offset, circle.radius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Circle {
  final Offset initialOffset;
  final Offset motion;
  final double radius;
  final Color color;

  Circle()
      : initialOffset =
            Offset(Random().nextDouble() * 400, Random().nextDouble() * 700),
        motion = Offset((Random().nextDouble() - 0.5) * 1000,
            (Random().nextDouble() - 0.5) * 50),
        radius = Random().nextDouble() * 50 + 20,
        color = Colors.white;
}
