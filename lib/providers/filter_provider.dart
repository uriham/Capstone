import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/data/prompts.dart';

enum Filter {
  none('none', Color.fromARGB(255, 255, 255, 255), 0),
  yangkee('yangkee', Color.fromARGB(255, 244, 41, 139), 1),
  myaomah('myaomah', Color.fromARGB(255, 64, 105, 205), 2),
  kimmunng('kimmunng', Color.fromARGB(255, 60, 184, 213), 3),
  pooh('pooh', Color.fromARGB(255, 12, 245, 174), 4),
  henry('henry', Color.fromARGB(255, 61, 136, 107), 4),
  leesang('leesang', Color.fromARGB(255, 251, 246, 231), 6),
  alsoubet('alsoubet', Color.fromARGB(255, 255, 222, 77), 7),
  irae('irae', Color.fromARGB(255, 255, 174, 79), 8),
  jangseung('jangseung', Color.fromARGB(255, 255, 102, 120), 9),
  yeonhwa('yeonwha', Color.fromARGB(255, 225, 35, 92), 10),
  grandma('grandma', Color.fromARGB(255, 158, 0, 255), 11);

  const Filter(this.name, this.color, this.number);
  final String name;
  final Color color;
  final int number;
}

class FiltersNotifier extends StateNotifier<Filter> {
  FiltersNotifier() : super(Filter.none);

  void setFilter(Filter filter) {
    state = filter;
    print(state);
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Filter>((ref) => FiltersNotifier());
