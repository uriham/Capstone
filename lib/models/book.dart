import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();


class Book {
  Book({
    required this.text,
    required this.url, //이미지 URL
    required this.date,
  });

  final String text;
  final String url;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }

  String getDayofMonth() {
    return date.day.toString();
  }
}
