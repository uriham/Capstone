import 'package:flutter/material.dart';
import 'package:capstone/widgets/calendar.dart';
import 'package:capstone/widgets/write_diary/read_diary.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/widgets/diary_show.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  final todayDiary = Diary(
    date: DateTime.now(),
    text: '''
이 프로젝트는 유저들의 일기를 다양한 테마로 재창작하여 새로운 경험과 관점을 제공함으로써, 자아성찰과 긍정적인 에너지를 유도하는 것을 목표로 합니다. 우리는 유저들이 일상적인 일기 작성을 넘어 특별하고 즐거운 순간을 경험하며, 동시에 자신의 감정과 생각에 대한 새로운 시각을 찾도록 이끌어내고자 합니다. 유저들의 일기는 특정 인물의 시점, 독특한 세계관, 특별한 인물 간의 편지 교환, 혹은 시의 형태로 재창작됩니다. 이를 통해 우리는 일상적인 경험을 예술적이고 창의적인 방식으로 변환함으로써, 창의성과 상상력을 자극하며 유저들이 자신의 감정과 경험을 더 깊이 자각하고 이해할 수 있도록 돕습니다.
        ''',
  );

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => ReadDiary(
                              todayDiary: todayDiary,
                            )));
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
