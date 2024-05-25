// glowing_circles_painter.dart
import 'package:flutter/material.dart';

class GlowingCirclesPainter extends CustomPainter {
  final AnimationController animation;
  final List<Circle> circles;

  GlowingCirclesPainter(this.animation, this.circles)
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final double progress = animation.value;

    for (var circle in circles) {
      final double offsetX =
          circle.initialOffset.dx + progress * circle.motion.dx;
      final double offsetY =
          circle.initialOffset.dy + progress * circle.motion.dy;

      final Offset offset = Offset(offsetX, offsetY);

      final gradient = RadialGradient(
        colors: [
          circle.color.withOpacity(0.4 + 0.2 * (1.0 - progress)),
          circle.color.withOpacity(0.0),
        ],
        stops: [0.1, 1.0],
      );

      final paint = Paint()
        ..shader = gradient.createShader(
          Rect.fromCircle(center: offset, radius: circle.radius),
        );

      canvas.drawCircle(offset, circle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Circle {
  final Offset initialOffset;
  late Offset motion;
  final double radius;
  final Color color;

  Circle({
    required this.initialOffset,
    required this.motion,
    required this.radius,
    required this.color,
  });
}
