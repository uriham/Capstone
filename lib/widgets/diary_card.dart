import 'package:capstone/widgets/diary_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/screens/read_diary_screen.dart';

class DiaryCard extends StatelessWidget {
  DiaryCard({super.key, required this.todayDiary, required this.index,required this.isLongTaped});

  final Diary todayDiary;
  final int index;
  final bool isLongTaped;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.10000000149011612),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: ListTile(
            trailing: isLongTaped ? const DiaryCheckBox() : null,
            title: Text(todayDiary.formattedDate,style: const TextStyle(fontSize: 20, color: Colors.white)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ReadDiaryScreen(
                    todayDiary: todayDiary,
                    index: index,
                  ),
                ),
              );
            },
            subtitle: Align(
              alignment: Alignment.centerLeft,
              child: Text(todayDiary.text,
                  style: const TextStyle(fontSize: 18, color: Colors.white)),
            ),
          )),
    );
  }
}/*
Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => ReadDiaryScreen(
                        todayDiary: todayDiary,
                        index : index,
                      ),
                    ),
                  );
*/