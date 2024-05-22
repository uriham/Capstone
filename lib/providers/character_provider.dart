import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/chapter.dart';
import 'package:capstone/models/character.dart';
import 'package:capstone/data/characters.dart';

// CharacterState 정의
class CharacterState extends StateNotifier<List<Character>> {
  CharacterState() : super(charList);

  void addChapter(String characterName, Chapter chapter) {
    state = [
      for (final character in state)
        if (character.name == characterName)
          character.changeChapters([chapter,...character.chapters])
        else
          character,
    ];
  }
}

// Provider 정의
final characterProvider = StateNotifierProvider<CharacterState, List<Character>>((ref) => CharacterState());
