import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/selected_diary_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key, required this.isCheck});

  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // 선택되었을 때와 선택되지 않았을 때의 이미지를 조건부로 설정
        image: DecorationImage(
          image: Svg(isCheck
              ? 'assets/images/D_seletion1_ic.svg'
              : 'assets/images/D_seletion0_ic.svg'),
          fit: BoxFit.cover,
        ),
      ),
      width: 38.0, // 이미지 크기 조정
      height: 38.0,
    );
  }
}
