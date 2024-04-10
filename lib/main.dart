import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:capstone/screens/tab.dart';
import 'package:capstone/env.dart';
import 'package:dart_openai/dart_openai.dart';



final theme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor:
      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
  ),
  cardTheme: const CardTheme().copyWith(
    color: const Color.fromARGB(1, 255, 255, 255),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);




void main() async{
  /*
 
*/



  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TapScreen(),
    );
  }
}
