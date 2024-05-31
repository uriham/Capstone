import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:capstone/screens/tab.dart';
import 'package:capstone/screens/tutorial_screen.dart';
import 'package:capstone/screens/myprofile_screen.dart';

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
      theme: theme,
      home: const InitialScreenDecider(),
    );
  }
}

class InitialScreenDecider extends StatefulWidget {
  const InitialScreenDecider({Key? key}) : super(key: key);

  @override
  _InitialScreenDeciderState createState() => _InitialScreenDeciderState();
}

class _InitialScreenDeciderState extends State<InitialScreenDecider> {
  bool _tutorialCompleted = false;

  void _completeTutorial() {
    setState(() {
      _tutorialCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget initialScreen = TutorialScreen();

    if (_tutorialCompleted) {
      initialScreen = const TabScreen();
    }

    return initialScreen;
  }
}
