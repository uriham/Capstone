import 'package:flutter/material.dart';
import 'package:prism_test/models/diary.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DiaryProvider extends ChangeNotifier {
  List<Diary> _diaries = [
    Diary(
        date: DateTime(2024, 3, 25),
        text:
            '''오늘은 맑은 가을 날씨였다. 따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. 나는 조금 더 잠을 자고 싶었지만, 새소리가 너무 시끄러워서 일어나기로 했다.
침대에서 나와 커튼을 열고 창문을 열었다. 시원한 가을 바람이 내 얼굴을 스쳤다. 나는 깊게 한숨을 들이쉬며 오늘 하루를 시작할 준비를 했다.

아침 식사를 하고 난 후, 나는 학교에 가기 위해 집을 나섰다. 학교까지 가는 길은 단풍잎으로 가득....|


 '''),
  ];
  static const String _diaryKey = 'diaries';
  late SharedPreferences _prefs;

  List<Diary> get diaries => _diaries;

  DiaryProvider() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _loadDiaries();
  }

  void _loadDiaries() {
    final List<String>? diaryStrings = _prefs.getStringList(_diaryKey);
    if (diaryStrings != null) {
      _diaries = diaryStrings
          .map((diaryString) => DiaryExtension.fromJson(diaryString))
          .toList();
      notifyListeners();
    }
  }

  void _saveDiaries() {
    final List<String> diaryStrings =
        _diaries.map((diary) => diary.toJson()).toList();
    _prefs.setStringList(_diaryKey, diaryStrings);
  }

  void addDiary(BuildContext context, String content) {
    final newDiary = Diary(text: content, date: DateTime.now());
    _diaries.add(newDiary);
    _saveDiaries();
    notifyListeners();
  }

  void updateDiary(int index, String newContent) {
    if (index >= 0 && index < _diaries.length) {
      _diaries[index] = Diary(text: newContent, date: DateTime.now());
      _saveDiaries();
      notifyListeners();
    }
  }

  void deleteDiary(int index) {
    if (index >= 0 && index < _diaries.length) {
      _diaries.removeAt(index);
      _saveDiaries();
      notifyListeners();
    }
  }

  Diary? getTodayDiary() {
    final now = DateTime.now();
    final todayDiaries = _diaries.where((diary) {
      return diary.date.year == now.year &&
          diary.date.month == now.month &&
          diary.date.day == now.day;
    }).toList();
    if (todayDiaries.isNotEmpty) {
      return todayDiaries.first;
    }
    return null;
  }
}
