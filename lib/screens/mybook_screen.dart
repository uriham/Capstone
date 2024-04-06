import 'package:flutter/material.dart';
import 'package:capstone/widgets/diary_show.dart';
import 'package:capstone/data/diarys.dart';

class MybookScreen extends StatefulWidget {
  const MybookScreen({super.key});

  @override
  State<MybookScreen> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<MybookScreen> {
  final todayDiary = allDiarys[0];
  void _myDiary() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 80), // 위쪽 여백 추가
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Card(
                child: DiaryShow(
                  todayDiary: todayDiary,
                ), //여기 바꿔야함
              ),
            ),
          ),
        ),
        SizedBox(height: 80),
      ],
    );
  }
}
