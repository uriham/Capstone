import 'package:capstone/data/diarys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/diary.dart';

DateTime now = DateTime.now();

class DiaryNotifier extends StateNotifier<List<Diary>> {
  DiaryNotifier() : super(allDiarys);

  void addDiary(Diary diary) {
    state = [diary, ...state];
  }

  void editTodayDiary(String inputText, int index, DateTime time) {
    var newValue = Diary(date: time, text: inputText);
    state = [
      ...state.take(index),
      newValue,
      ...state.skip(index + 1),
    ];
  }
}

final diaryProvider = StateNotifierProvider<DiaryNotifier, List<Diary>>((ref) {
  return DiaryNotifier();
});
