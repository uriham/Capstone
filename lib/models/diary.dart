import 'package:intl/intl.dart';
import 'dart:convert';

class Diary {
  final DateTime date;
  final String text;

  Diary({
    required this.date,
    required this.text,
  });

  String toJson() {
    return '{"text": "$text", "date": "${date.toIso8601String()}"}';
  }
}

extension DiaryExtension on Diary {
  static Diary fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return Diary(
      text: json['text'],
      date: DateTime.parse(json['date']),
    );
  }
}
