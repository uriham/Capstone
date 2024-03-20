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
산산이 부서진 이름이여
허공 중에 헤어진 이름이여
          불러도 주인 없는 이름이여
          부르다가 내가 죽을 이름이여

          심중에 남아 있는 말 한마디는
          끝끝내 마저 하지 못하였구나.
          사랑하던 그 사람이여
          사랑하던 그 사람이여

          붉은 해가 서산 마루에 걸리었다.
          사슴의 무리도 슬피 운다.
          떨어져 나가 앉은 산 위에서
          나는 그대의 이름을 부르노라.

          설움에 겹도록 부르노라.
          설움에 겹도록 부르노라.
          부르는 소리는 비껴가지만
          하늘과 땅 사이가 너무 넓구나.

          선 채로 이 자리에 돌이 되어도
          부르다가 내가 죽을 이름이여
          사랑하던 그 사람이여
          사랑하던 그 사람이여
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
                    MaterialPageRoute(builder: (ctx) => ReadScreen(todayDairy: todayDairy,)));
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
