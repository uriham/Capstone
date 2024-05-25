import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/chapter.dart';
import 'package:capstone/models/character.dart';
import 'package:capstone/data/characters.dart';
import 'package:capstone/providers/filter_provider.dart';

// BookState 정의
class BookState extends StateNotifier<List<Character>> {
  BookState() : super(bookList);

  void addChapter(Filter filter, Chapter chapter) {
    state = [
      for (final character in state)
        if (character.name == filter.name)
          character.changeChapters([chapter,...character.chapters]) //시간순으로 정렬되지 않았음
        else
          character,
    ];
  }
}

// Provider 정의
final bookProvider = StateNotifierProvider<BookState, List<Character>>((ref) => BookState());
