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
  void _changedDiary(){
    setState(() {
    });
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
      body:
          ListView(padding: const EdgeInsets.fromLTRB(6, 60, 6, 6), children: [
        const Text('Welcom! \nKim Shin woo!', style: TextStyle(fontSize: 39)),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => ReadDiaryScreen(
                  todayDiary: todayDiary,
                  onPressed:_changedDiary,
                 
                ),
              ),
            );
          },
          child: Card(
              child: DiaryShow(
            todayDiary: todayDiary,
          )),
        ),
      ]),
    );
  }
}
