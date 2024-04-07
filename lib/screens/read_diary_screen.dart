import 'package:capstone/widgets/diary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';

class ReadDiaryScreen extends StatelessWidget {
  const ReadDiaryScreen(
      {super.key, required this.todayDiary});

  final Diary todayDiary;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로 가기 버튼을 눌렀을 때 수행할 동작을 여기에 추가하세요.
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            todayDiary.formattedDate,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          DiaryTextField(
            todayDiary: todayDiary,

          ),
        ]),
      ),
    );
  }
}
