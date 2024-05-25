import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  none('none'),
  myaomah('myaomah'),
  kimmunng('kimmunng'),
  yangkee('yangkee'),
  pooh('pooh'),
  leesang('leesang'),
  henry('henry');
  const Filter(this.name);    
  final String name;
}

class FiltersNotifier extends StateNotifier<Filter> {
  FiltersNotifier()
      : super(Filter.none);

  void setFilter(Filter filter) {
    state = filter;
    print(state);
  }

}
final filterProvider = StateNotifierProvider<FiltersNotifier,Filter>((ref) => FiltersNotifier());