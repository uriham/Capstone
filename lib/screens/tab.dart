import 'package:capstone/screens/mybook_screen.dart';
import 'package:capstone/screens/palette_screen.dart';
import 'package:capstone/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:capstone/screens/calendar.dart';
import 'package:capstone/screens/read_diary_screen.dart';
import 'package:capstone/widgets/diary_show.dart';
import 'package:capstone/data/diarys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TapScreen extends ConsumerStatefulWidget {
  const TapScreen({super.key});

  @override
  ConsumerState<TapScreen> createState() {
    return _TapScreenState();
  }
}

class _TapScreenState extends ConsumerState<TapScreen> {
  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = StartScreen();
    var activePageTitle = 'Dairy';

    if (_selectedPageIndex == 0) {
      activePageTitle = 'My Book';
      activePage = MybookScreen();
    }

    if (_selectedPageIndex == 2) {
      activePageTitle = 'Palette';
      activePage = PaletteScreen();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'My Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Main',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.palette),
            label: 'Palette',
          ),
        ],
      ),
        
        );
  }
}
