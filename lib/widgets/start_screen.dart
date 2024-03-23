import 'package:flutter/material.dart';
import 'package:capstone/widgets/calendar.dart';
import 'package:capstone/widgets/read_diary.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/widgets/diary_show.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todayDairy = Diary(
        date: DateTime.now(),
        text: '''
산산이 부서진 이름이여 부름을 응답하는 것은왜이렇게 
어려운 것일까
        ''');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => CalendarWidget()),
              );
            },
          )
        ],
      ),
      body: ListView(
          padding: const EdgeInsets.fromLTRB(10, 60, 10, 10),
          children: [
            const Text('Welcom! \nKim Shin woo!',
                style: TextStyle(fontSize: 39)),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => ReadDairy(todayDairy: todayDairy,)));
              },
              child: Card(
                  child: DiaryShow(
                todayDiary: todayDairy,
              )),
            ),
          ]),
    );
  }
}
