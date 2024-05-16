import 'package:capstone/providers/diary_provider.dart';
import 'package:capstone/providers/selected_diary_provider.dart';
import 'package:capstone/screens/bookcover_screen.dart';
import 'package:capstone/screens/start_screen.dart';
import 'package:capstone/widgets/my_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone/models/diary.dart';

class TapScreen extends ConsumerWidget {
  const TapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDiary = ref.watch(diaryProvider);
    final selectedDiary = ref.watch(selectedDiarysProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text(
          "Diary",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'KoPubWorldDotum_Pro',
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: StartScreen(
        todayDiary: allDiary,
      ),
      floatingActionButton: Transform.translate(
        // Generate버튼 있는 곳
        offset: const Offset(0, 8),
        child: IconButton(
          icon: SvgPicture.asset(
            'assets/images/D_generate_button.svg',
            height: 86.46,
            width: 86.46,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) {
                Diary combinedDiary = selectedDiary.reduce((diary1, diary2) {
                  return Diary(
                      date: diary1.date,
                      text: '${diary1.text} \n +${diary2.text}');
                });
                return BookCoverScreen(
                  selectedDiary: combinedDiary,
                );
              }),
            );
            ref.read(selectedDiarysProvider.notifier).deleterAllDiary();
            ref.read(selectedDiarysProvider.notifier).printState();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
