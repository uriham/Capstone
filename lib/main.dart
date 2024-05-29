import 'package:flutter/material.dart';
import 'package:prism_test/screens/cover_screen.dart';
import 'package:prism_test/screens/start_screen.dart';
// import 'package:prism_test/screens/mybook_screen.dart';
// import 'package:prism_test/models/book_example.dart';

final theme = ThemeData.dark().copyWith(
  cardTheme: const CardTheme().copyWith(
    color: const Color.fromARGB(1, 255, 255, 255),
  ),
);

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: StartScreen(),
      //home: CharCoverScreen(),
      //home: MybookScreen(),
    );
  }
}
