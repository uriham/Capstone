import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/data/prompts.dart';

enum Filter {
  none('none', Color.fromARGB(255, 255, 255, 255), 0),
  yangkee('귀여운 것은 곧 사랑이다', Color.fromARGB(255, 244, 41, 139), 1),
  myaomah('먀오마아의 은밀한 취미생활', Color.fromARGB(255, 64, 105, 205), 2),
  kimmunng('우리도 모르는 우리들의 별빛', Color.fromARGB(255, 60, 184, 213), 3),
  pooh('Winnie the Pooh', Color.fromARGB(255, 12, 245, 174), 4),
  henry('숲 속을 거닐다', Color.fromARGB(255, 61, 136, 107), 4),
  leesang('동생 보아라', Color.fromARGB(255, 251, 246, 231), 6),
  alsoubet('그리스 앞바다', Color.fromARGB(255, 255, 222, 77), 7),
  irae('동자청풍', Color.fromARGB(255, 255, 174, 79), 8),
  jangseung('풍하마을 수호 장승', Color.fromARGB(255, 255, 102, 120), 9),
  yeonhwa('심연의 화원', Color.fromARGB(255, 225, 35, 92), 10),
  grandma('할머니', Color.fromARGB(255, 158, 0, 255), 11);

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
