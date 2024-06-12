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
    // 여기서 어떤 스크린을 보여줄지 결정합니다.
    Widget initialScreen = const TutorialScreen(); // 초기 스크린은 튜토리얼로 설정됩니다.

    // 튜토리얼을 이미 본 경우, TabScreen을 초기 스크린으로 설정합니다.
    // 이 로직은 SharedPreferences 또는 다른 지속성 도구를 사용하여 사용자가 튜토리얼을 본 여부를 추적하는 방법으로 대체될 수 있습니다.
    bool tutorialCompleted = false; // 여기서는 임시로 false로 설정합니다.

    if (tutorialCompleted) {
      initialScreen = const TabScreen();
    }

    return MaterialApp(
      routes: {
        "/first": (context) => const TabScreen(),
      },
      theme: theme,
      home: initialScreen, // 초기 스크린 설정
    );
  }
}
