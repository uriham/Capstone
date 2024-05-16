import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:capstone/models/diary.dart';

class SelectedDiarysNotifier extends StateNotifier<List<Diary>> {
  SelectedDiarysNotifier() : super([]);

  void addSelectedDiary(Diary diary) {
    final diaryIsSelected = state.contains(diary);

    if (diaryIsSelected) {
      state = state.where((m) => m.text != diary.text).toList();
      //return false;
    } else {
      state = [...state, diary];
      //return true;
    }
  }

  void deleterAllDiary(){
    state = [];
  }

  void printState(){
    print(state);
  }
}

final selectedDiarysProvider =
    StateNotifierProvider<SelectedDiarysNotifier, List<Diary>>((ref) {
  return SelectedDiarysNotifier();
});