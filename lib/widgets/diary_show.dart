import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';

class DiaryShow extends StatefulWidget {
  const DiaryShow({super.key, required this.todayDiary});

  final Diary todayDiary;

  @override
  State<DiaryShow> createState() {
    return _TodayDiaryState();
  }
}

class _TodayDiaryState extends State<DiaryShow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset('assets/images/StarryNight.jpg',height: 400,),
          const SizedBox( height: 16,),
          Row(children : [
            Text(widget.todayDiary.formattedDate,style: const TextStyle(fontSize: 20,),),
            const SizedBox(width: 30,),
            Container(width: 200,
           child: const Divider(color: Color.fromARGB(255, 240, 226, 225), thickness: 2.0)),
          ],),
          const SizedBox(height: 16,),
          Text(widget.todayDiary.text),
        ],
      ),
    );
  }
}
