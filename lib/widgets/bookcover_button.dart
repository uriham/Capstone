import 'package:flutter/material.dart';

class BookCoverButton extends StatelessWidget {
  const BookCoverButton({super.key, required this.onTap, required this.buttonText});

  final void Function() onTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 46,
        padding: const EdgeInsets.only(bottom: 0.26),
        decoration: ShapeDecoration(
          color: const Color(0xFF0E0E0E),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Color(0xFFFF2287)),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.72,
          ),
        ),
      ),
    );
  }
}
