import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookNotifier extends StateNotifier<List<String>> {
  BookNotifier() : super([]);

  void addBook(String text) {
    {
      state = [text,...state ];
    }
  }
}

final bookProvider =
    StateNotifierProvider<BookNotifier, List<String>>((ref) {
  return BookNotifier();
});
