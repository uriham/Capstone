import 'package:intl/intl.dart';
import 'package:capstone/providers/filter_provider.dart';

final formatter = DateFormat('yyyy.MM.dd');
final dayOfWeek = DateFormat('E요일', 'ko_KR');

class Diary {
  Diary(
      {required this.date,
      required this.text,
      this.isUsed = false,
      this.filter = Filter.none});

  final String text;
  final DateTime date;
  bool isUsed;
  Filter filter;

  String get formattedDate {
    return formatter.format(date);
  }

  String get koreanDay {
    return dayOfWeek.format(date);
  }

  String get month {
    return date.month.toString();
  }

  String get day {
    //
    return date.day.toString();
  }

  void useDiary() {
    isUsed = !isUsed;
  }

  void changeFilter(Filter inputFilter) {
    filter = inputFilter;
  }
  //get을 사용하는 것은 보안의 위험 때문인가? var를 사용해서 다른 변수에 저장하기 귀찮아서?
}
