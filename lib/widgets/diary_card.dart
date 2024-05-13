import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/screens/read_diary_screen.dart';

class DiaryCard extends StatelessWidget {
  const DiaryCard({super.key, required this.todayDiary});

  final Diary todayDiary;

  @override
  /*Container(
              width: 329,
              height: 93,
              padding: const EdgeInsets.only(bottom: 0.52),
              decoration: ShapeDecoration(
                color:
                    const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => ReadDiaryScreen(
                        todayDiary: todayDiary,
                      ),
                    ),
                  );
                },
                child: DiaryCard(
                  todayDiary: todayDiary,
                ),
              ),
            ), */
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){ Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => ReadDiaryScreen(
                        todayDiary: todayDiary,
                      ),
                    ),
                  );},
      child: Card(
        color: Colors.white.withOpacity(0.10000000149011612),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Column(
            children: [
              Text(todayDiary.getDayofMonth(),style: const TextStyle(fontSize: 20, color: Colors.white)),
              const SizedBox(height: 4),
              Text(todayDiary.text,style: const TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
