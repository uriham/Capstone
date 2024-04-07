import 'package:flutter/material.dart';
import 'package:capstone/screens/start_screen.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
  ),
  cardTheme: const CardTheme().copyWith(
    color: const Color.fromARGB(1, 255, 255, 255),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
  // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //   backgroundColor: Color.fromARGB(255, 0, 0, 0),
  // ),
);
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const StartScreen(),
    );
  }
}

class BookItem {
  final String urlImage;
  final String date;
  final String title;

  const BookItem({
    required this.urlImage,
    required this.date,
    required this.title,
  });
}
