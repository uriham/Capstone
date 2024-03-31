import 'package:capstone/screens/mybook_screen.dart';
import 'package:capstone/screens/palette_screen.dart';
import 'package:flutter/material.dart';
import 'package:capstone/screens/calendar.dart';
import 'package:capstone/screens/read_diary.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/widgets/diary_show.dart';
import 'package:capstone/data/diarys.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  final todayDiary = allDiarys[0];
  void _changedDiary() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const CalendarWidget()),
              );
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 80), // 위쪽 여백 추가
          const Text(
            '안녕하세요 \nUser님',
            style: TextStyle(fontSize: 39, color: Colors.white),
          ),
          const SizedBox(height: 130),
          const Text(
            '오늘의 기록',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white)),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => ReadDiaryScreen(
                        todayDiary: todayDiary,
                        onPressed: _changedDiary,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: DiaryShow(
                    todayDiary: todayDiary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        //height: 70,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu_book),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const MybookScreen()),
                );
              },
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.palette),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const PaletteScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
