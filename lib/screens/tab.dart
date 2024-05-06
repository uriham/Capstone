import 'dart:ui';

import 'package:capstone/providers/diary_provider.dart';
import 'package:capstone/screens/bookcover_screen.dart';

import 'package:capstone/screens/start_screen.dart';
import 'package:capstone/widgets/my_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TapScreen extends ConsumerWidget {
  const TapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDiary = ref.watch(diaryProvider);
     

    return Scaffold(
      appBar: AppBar(
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
        todayDiary: allDiary[0],
      ),
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 8),
        child: IconButton(
          icon: SvgPicture.asset('assets/images/D_generate_button.svg',height: 86.46,width: 86.46,),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) {
                return BookCoverScreen();
              }),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
