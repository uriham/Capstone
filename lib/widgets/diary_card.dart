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
    return Card(
      color: Colors.white.withOpacity(0.10000000149011612),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child:DiaryListTile(todayDiary: todayDiary,isLongTaped : isLongTaped,index:index)),
    );
  }
}