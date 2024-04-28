import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  final String photo;
  final double width;
  final double height;
  final double borderRadius;
  final VoidCallback? onTap;

  const PhotoHero({
    Key? key,
    required this.photo,
    required this.width,
    required this.height,
    this.onTap,
    this.borderRadius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: photo, // Hero 태그
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: SizedBox(
            width: width,
            height: height,
            child: Image.network(
              photo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}