import 'package:flutter/material.dart';
import 'package:capstone/screens/start_screen.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor:
      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
  ),
  cardTheme: CardTheme().copyWith(
    color: const Color.fromARGB(1, 255, 255, 255),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:
              const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor:
                const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
          ),
          cardTheme: CardTheme().copyWith(
            color: const Color.fromARGB(1, 255, 255, 255),
          )),
      home: const StartScreen(),
    );
  }
}
/*void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:
              const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor:
                const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
          ),
          cardTheme: CardTheme().copyWith(
            color: const Color.fromARGB(1, 255, 255, 255),
          )),
      home: const StartScreen(),
    ),
  );
}*/ 