import 'package:flutter/material.dart';
import 'package:capstone/screens/start_screen.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: const Color.fromARGB(255, 30, 30, 30),
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
  // WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   timeDilation = 5.0; // 또는 원하는 값
  // });

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
