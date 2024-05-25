import 'package:capstone/models/diary.dart';

DateTime now = DateTime.now();

List<Diary> allDiarys = [
  Diary(
      date: now,
      text:
          "#날씨"),
  Diary(
      date: DateTime(now.year, now.month, now.day - 1),
      text: "This is the example of yesterdays diarydsfsdfdsfdsadawdawdadawdadadadadawdadadawdawddadwadkjadjkawjkahjfkbawjkfawbfjawfkjawfjkabwfjkbawkjfbjakwbfjkabfkjawbfjk"),
      
  Diary(
      date: DateTime(now.year, now.month, now.day - 2),
      text: "This is the example of yesterdays diary"),
  Diary(
      date: DateTime(now.year, now.month, now.day - 3),
      text: "This is the example of yesterdays diary"),
];
