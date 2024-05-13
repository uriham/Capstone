import 'package:flutter/material.dart';

// PhotoHero 클래스 (book 클릭하면 사진 확대되며 화면 차지)
class PhotoHero extends StatelessWidget {
  const PhotoHero({
    super.key,
    required this.photo,
    this.onTap,
    //required this.width,
  });

  final String photo;
  final VoidCallback? onTap;
  //final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
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
