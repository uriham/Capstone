import 'package:capstone/screens/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:capstone/screens/tab.dart';
import 'package:intl/date_symbol_data_local.dart';

final theme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: Colors.black,
  ),
  cardTheme: const CardTheme().copyWith(
    color: const Color.fromARGB(1, 255, 255, 255),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  initializeDateFormatting('ko_KR')
      .then((_) => runApp(const ProviderScope(child: App())));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/first": (context) => const TabScreen(),
      },
      theme: theme,
      home: const TutorialScreen(),
    );
  }
}
