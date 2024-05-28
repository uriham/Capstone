import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  none('none', Color.fromARGB(255, 255, 255, 255)),
  myaomah('myaomah', Color.fromARGB(255, 64, 105, 205)),
  kimmunng('kimmunng', Color.fromARGB(255, 60, 184, 213)),
  yangkee('yangkee', Color.fromARGB(255, 244, 41, 139)),
  pooh('pooh', Color.fromARGB(255, 12, 245, 174)),
  leesang('leesang', Color.fromARGB(255, 251, 246, 231)),
  henry('henry', Color.fromARGB(255, 61, 136, 107));

  const Filter(this.name, this.color);
  final String name;
  final Color color;
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
