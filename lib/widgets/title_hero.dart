import 'package:flutter/material.dart';

// TitleHero 클래스 (book 누르면 타이틀 밑으로 이동)
class TitleHero extends StatelessWidget {
  const TitleHero({
    super.key,
    required this.title,
    this.onTap,
    // required this.width,
    // required this.height,
    required this.size,
  });

  final String title;
  final VoidCallback? onTap;
  // final double width;
  // final double height;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: size,
            ),
          ),
        ),
      ),
    );
  }
}
