import 'package:capstone/data/diarys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/diary.dart';

DateTime now = DateTime.now();

class DiaryNotifier extends StateNotifier<List<Diary>> {
  DiaryNotifier() : super(allDiarys);

  void addDiary(Diary diary) {
    state = [diary, ...state];
  }

  void editTodayDiary(String inputText, int index, DateTime time, bool isUsed) {
    var newValue = Diary(date: time, text: inputText,isUsed: isUsed);
    state = [
      ...state.take(index),
      newValue,
      ...state.skip(index + 1),
    ];
  }

  void useDiary(int index){
    var newDiary = state[index];
    newDiary.useDiary();
    state = [
      ...state.take(index),
      newDiary,
      ...state.skip(index + 1),
    ];
  }
}

final diaryProvider = StateNotifierProvider<DiaryNotifier, List<Diary>>((ref) {
  return DiaryNotifier();
});
