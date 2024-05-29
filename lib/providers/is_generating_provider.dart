import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/chapter.dart';
import 'package:capstone/models/character.dart';
import 'package:capstone/data/characters.dart';
import 'package:capstone/providers/filter_provider.dart';

// IsGeneratingState 정의
class IsGeneratingState extends StateNotifier<bool> {
  IsGeneratingState() : super(false);

  void changeState() {
    state = !state;
  }
}

// Provider 정의
final isGeneratingProvider = StateNotifierProvider<IsGeneratingState, bool>(
    (ref) => IsGeneratingState());
