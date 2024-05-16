
import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();

class Diary {
  Diary({
    required this.date,
    required this.text,
    this.isUsed=false
  });

  final String text;
  final DateTime date;
  bool isUsed;

  String get formattedDate {
    return formatter.format(date);
  }

  String getDayofMonth() {
    return date.day.toString();
  }
  //get을 사용하는 것은 보안의 위험 때문인가? var를 사용해서 다른 변수에 저장하기 귀찮아서?
}
