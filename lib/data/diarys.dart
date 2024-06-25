import 'package:capstone/models/diary.dart';

DateTime now = DateTime.now();

List<Diary> allDiarys = [
  Diary(date: now, text: "졸업전시를 준비하며.... \n오늘 또 수많은 과제와 회의가 있었던 하루였다."),
  Diary(
      date: DateTime(now.year, now.month, now.day - 3),
      text:
          "도시의 가로등으로 매미의 수명은 짧아졌을까. \n늘 궁금했던 의문에 대답다운 대답은 나오지 않았다. \n빛 없는 가로등을 찾아 오는 이여 내게 오라"),
];
