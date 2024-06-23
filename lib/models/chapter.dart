import 'package:intl/intl.dart';

final formatter = DateFormat('yyyy.MM.dd');

class Chapter {
  final String chImg;
  final DateTime date;
  final String title;
  final String text;

  Chapter({
    required this.chImg,
    required this.date,
    required this.title,
    required this.text,
  });
  String get formattedDate {
    return formatter.format(date);
  }
}
