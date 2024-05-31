import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/data/prompts.dart';

enum Filter {
  none('none', Color.fromARGB(255, 255, 255, 255), 0),
  myaomah('myaomah', Color.fromARGB(255, 64, 105, 205), 1),
  kimmunng('kimmunng', Color.fromARGB(255, 60, 184, 213), 2),
  yangkee('yangkee', Color.fromARGB(255, 244, 41, 139), 3),
  pooh('pooh', Color.fromARGB(255, 12, 245, 174), 4),
  leesang('leesang', Color.fromARGB(255, 251, 246, 231), 5),
  henry('henry', Color.fromARGB(255, 61, 136, 107), 6);

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
