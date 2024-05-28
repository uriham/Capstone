import 'package:capstone/providers/diary_provider.dart';
import 'package:capstone/providers/filter_provider.dart';
import 'package:capstone/providers/selected_diary_provider.dart';
import 'package:capstone/screens/bookcover_screen.dart';
import 'package:capstone/screens/start_screen.dart';
import 'package:capstone/widgets/generate_bottombar.dart';
import 'package:capstone/widgets/my_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/screens/myprofile_screen.dart';
import 'package:capstone/screens/profile_setting.dart';
import 'package:capstone/widgets/my_bottom_appbar2.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({
    super.key,
    //required this.userName,
    this.selectedImage,
  });
  //final String userName;
  final String? selectedImage;
  @override
  ConsumerState<TabScreen> createState() {
    return _TapScreenState();
  }
}

class _TapScreenState extends ConsumerState<TabScreen> {
  bool isGenerating = false;

  void clikcGenerate() {
    setState(() {
      isGenerating = !isGenerating;
    });
  }

  void _showMessage(String message) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text(
              '오류',
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('Okay'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final allDiary = ref.watch(diaryProvider);
    final selectedDiary = ref.watch(selectedDiarysProvider);
    final selectedFilter = ref.watch(filterProvider);

    void noneFilter() {
      if (selectedFilter == Filter.none) {
        _showMessage('먼저 테마를 정해주세요');
      } else {
        clikcGenerate();
      }
    }

    void makeBook() {
      //애가 최종 전달자 이다. generat bar에 있어야 하는 놈

      final List<int> indexList = [];
      for (Diary diary in selectedDiary) {
        indexList.add(allDiary.indexOf(diary));
        //ref.read(diaryProvider.notifier).editTodayDiary(diary.text,a, diary.date,true);
      }
      if (indexList.isEmpty) {
        _showMessage('변환할 일기를 선택해 주세요');
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) {
            Diary combinedDiary = selectedDiary.reduce((diary1, diary2) {
              return Diary(
                  date: diary1.date, text: '${diary1.text} \n +${diary2.text}');
            });
            return BookCoverScreen(
              indexList: indexList,
              selectedDiary: combinedDiary,
              nowFilter: selectedFilter,
            );
          }),
        );
        ref.read(selectedDiarysProvider.notifier).deleterAllDiary();
        ref.read(selectedDiarysProvider.notifier).printState();
      }
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (isGenerating) clikcGenerate();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return const Profile(
                    userName: 'shinwoo',
                  );
                }));
              },
              child: const Icon(
                Icons.circle_outlined,
                size: 38,
              ),
            ),
          ],
          title: const Text(
            "Diary",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontFamily: 'KoPubWorldDotum_Pro',
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          StartScreen(
            //userName: 'sinwoo', // 사용자 이름을 StartScreen으로 전달
            diaryList: allDiary,
            nowFilter: selectedFilter,
            isGenerating: isGenerating,
          ),
          isGenerating
              ? GenerateBottomBar(
                  clickGenerate: makeBook,
                )
              : MyBottomAppBar2(
                  clikcGenerate: noneFilter, currentFilter: selectedFilter),
        ]),
        /*
        floatingActionButton: Transform.translate(
          // Generate 버튼 있는 곳
          offset: const Offset(0, 8),
          child: IconButton(
              icon: SvgPicture.asset(
                'assets/images/D_generate_button.svg',
                height: 86.46,
                width: 86.46,
              ),
              onPressed: pressGenerate),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const MyBottomAppBar(),*/
      ),
    );
  }
}
