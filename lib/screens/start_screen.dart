import 'package:flutter/material.dart';
import 'package:capstone/screens/read_diary_screen.dart';
import 'package:capstone/widgets/diary_show.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/screens/mybook_screen.dart';
import 'package:capstone/screens/calendar.dart';
import 'package:capstone/screens/palette_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.todayDiary});

  final Diary todayDiary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 60), // 위쪽 여백 추가
          const Text(
            '안녕하세요 \nUser님',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'KoPubWorldDotum_Pro',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const SizedBox(height: 100),
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(
                'assets/images/D_PRISM_ic.svg',
                width: 30,
                height: 30,
              ),
              const Text(
                '  오늘의 기록',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
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
                child: DiaryShow(
                  todayDiary: todayDiary,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
