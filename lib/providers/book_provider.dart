import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/book.dart';

class BookNotifier extends StateNotifier<List<Book>> {
  BookNotifier() : super([]);

  void addBook(String text, String url, DateTime date, String title) {
    {
      state = [Book(date: date, text: text, url: url, title: title), ...state];
    }
  }
}

final bookProvider = StateNotifierProvider<BookNotifier, List<Book>>((ref) {
  return BookNotifier();
});
