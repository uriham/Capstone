import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';

class DiaryShow extends StatelessWidget {
  const DiaryShow({super.key, required this.todayDiary});

  final Diary todayDiary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.left,
            todayDiary.getDayofMonth(),
            style: const TextStyle(
              fontSize: 45,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            todayDiary.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
