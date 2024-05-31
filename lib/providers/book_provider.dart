import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/chapter.dart';
import 'package:capstone/models/character.dart';
import 'package:capstone/data/characters.dart';
import 'package:capstone/providers/filter_provider.dart';

// BookState 정의
class BookState extends StateNotifier<List<Character>> {
  BookState() : super(charList);

  void addChapter(Filter filter, Chapter chapter) {
    state = [
      for (final character in state)
        if (character.filter == filter)
          character
              .changeChapters([chapter, ...character.chapters]) //시간순으로 정렬되지 않았음
        else
          character, // 필터 같으면 chapter 뽑아낸 캐릭터 만들어 낸다.
    ];
  }

  Character getCharacter(Filter filter) {
    for (final character in state) {
      if (character.filter == filter) return character;
    }
    // 필요한 경우 기본값이나 예외를 반환할 수 있습니다.
    throw Exception('Character not found for filter: $filter');
  }
}

// Provider 정의
final bookProvider =
    StateNotifierProvider<BookState, List<Character>>((ref) => BookState());
