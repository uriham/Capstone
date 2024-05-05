import 'package:flutter/material.dart';

class BookCoverButton extends StatelessWidget{
  const BookCoverButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 46,
                  padding: const EdgeInsets.only(bottom: 0.26),
                  decoration: ShapeDecoration(
                    color: Color(0xFF0E0E0E),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Color(0xFFFF2287)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    '그려내기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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