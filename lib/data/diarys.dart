import 'package:capstone/models/diary.dart';

DateTime now = DateTime.now();

List<Diary> allDiarys = [
  Diary(
      date: now,
      text:
          "#날씨가 포근해지고~ 따뜻한 봄 햇살이 비치고 있어요. \n#오늘 하루를 기록해봐요. 봄 햇살 아래 소중한 순간들을 함께 담아요."),
  Diary(
      date: DateTime(now.year, now.month, now.day - 1),
      text: "This is the example of yesterdays diary"),
  Diary(
      date: DateTime(now.year, now.month, now.day - 2),
      text: "This is the example of yesterdays diary"),
  Diary(
      date: DateTime(now.year, now.month, now.day - 3),
      text: "This is the example of yesterdays diary"),
];
