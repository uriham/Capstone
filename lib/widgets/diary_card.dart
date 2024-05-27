import 'package:capstone/widgets/diary_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/screens/read_diary_screen.dart';

class DiaryCard extends StatelessWidget {
  const DiaryCard(
      {super.key,
      required this.todayDiary,
      required this.index,
      required this.isLongTaped});

  final Diary todayDiary;
  final int index;
  final bool isLongTaped;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.10000000149011612),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF414141)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child:  DiaryListTile(
            todayDiary: todayDiary, isLongTaped: isLongTaped, index: index),
     
    );
  }
}
