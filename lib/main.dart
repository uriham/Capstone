import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:capstone/screens/tab.dart';
import 'package:intl/date_symbol_data_local.dart';

final theme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor:
      Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
  ),
  cardTheme: const CardTheme().copyWith(
    color: const Color.fromARGB(1, 255, 255, 255),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  initializeDateFormatting('ko_KR').then((_) => runApp(const ProviderScope(child: App())));
  ;
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/first": (context) => const TabScreen(),},
      theme: theme,
      home: const TabScreen(),
    );
  }
}
