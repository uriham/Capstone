// glowing_circles_painter.dart
import 'package:flutter/material.dart';
import 'dart:math';

class GlowingCirclesPainter extends CustomPainter {
  final AnimationController animation;
  final List<Circle> circles;

  GlowingCirclesPainter({required this.animation, required this.circles});

  @override
  void paint(Canvas canvas, Size size) {
    final double progress = animation.value;

    for (var circle in circles) {
      // final double offsetX =
      //     circle.initialOffset.dx + progress * circle.motion.dx;
      // final double offsetY =
      //     circle.initialOffset.dy + progress * circle.motion.dy;

      // final Offset offset = Offset(offsetX, offsetY);

      final gradient = RadialGradient(
        colors: [
          circle.color.withOpacity(0.4 + 0.2 * (1.0 - progress)),
          circle.color.withOpacity(0.0),
        ],
        stops: const [0.1, 1.0],
      );

      final paint = Paint()
        ..shader = gradient.createShader(Rect.fromCircle(
            center: Offset(circle.x, circle.y), radius: circle.radius));

      canvas.drawCircle(Offset(circle.x, circle.y), circle.radius, paint);

      // final paint = Paint()
      //   ..shader = gradient.createShader(
      //     Rect.fromCircle(center: offset, radius: circle.radius),
      //   );

      // canvas.drawCircle(offset, circle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Circle {
  double x;
  double y;
  double radius;
  double dx;
  double dy;
  Color color;
  final double speed = 1.0;

  double opacityIncrement = 0.002; // 투명도 증가량
  late DateTime creationTime; // 생성된 시간

  Circle({required Random random, required Size screenSize})
      : x = random.nextDouble() * screenSize.width,
        y = random.nextDouble() * screenSize.height,
        radius = random.nextDouble() * 90 + 40,
        dx = random.nextDouble() * 4 - 2,
        dy = random.nextDouble() * 4 - 2,
        color = Colors.white.withOpacity(0.05),
        creationTime = DateTime.now();

  void updatePosition() {
    x += dx * speed;
    y += dy * speed;
  }

  void updateColor() {
    // 현재 시간과 생성된 시간의 차이에 따라 투명도를 조절
    final timeDifference =
        DateTime.now().difference(creationTime).inMilliseconds;
    final double opacity = 0.1 + (timeDifference / 10000) * opacityIncrement;
    color = color.withOpacity(opacity);
    // if (color.opacity >= 1.0) {
    //   color = Colors.transparent; // 투명 색상으로 설정하여 그라데이션을 끝냄
    // }
  }

  bool isOutsideScreen(Size screenSize) {
    return x < -radius ||
        x > screenSize.width + radius ||
        y < -radius ||
        y > screenSize.height + radius;
  }
}

// class Circle {
//   final Offset initialOffset;
//   late Offset motion;
//   final double radius;
//   final Color color;

//   Circle({
//     required this.initialOffset,
//     required this.motion,
//     required this.radius,
//     required this.color,
//   });
// }
