import 'package:capstone/providers/diary_provider.dart';
import 'package:capstone/providers/filter_provider.dart';
import 'package:capstone/providers/selected_diary_provider.dart';
import 'package:capstone/screens/bookcover_screen.dart';
import 'package:capstone/screens/start_screen.dart';
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
  bool isLongTaped = false;
  
  void _noneFilter() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text(
              '오류',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              '먼저 테마를 선택해 주세요',
              style: TextStyle(color: Colors.white),
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
    void pressGenerate(){ //애가 최종 전달자 이다.
      if (selectedFilter == Filter.none) {
              _noneFilter();
            } else {
              final List<int> indexList = [];
              for (Diary diary in selectedDiary) {
                indexList.add(allDiary.indexOf(diary));
                //ref.read(diaryProvider.notifier).editTodayDiary(diary.text,a, diary.date,true);
              }
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) {
                  Diary combinedDiary = selectedDiary.reduce((diary1, diary2) {
                    return Diary(
                        date: diary1.date,
                        text: '${diary1.text} \n +${diary2.text}');
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

    return Scaffold(
      appBar: AppBar(
        actions: [
          // 우측 정렬을 위한 Spacer 추가
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const Profile(
                  userName: 'shinwoo',
                  // 선택된 이미지 전달
                );
              }));
            },
            child: const Icon(Icons.circle),
          ),
        ],
        title: const Text(
          "Diary",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'KoPubWorldDotum_Pro',
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: StartScreen(
        //userName: 'sinwoo', // 사용자 이름을 StartScreen으로 전달
        diaryList: allDiary,
        nowFilter: selectedFilter,
      ),
      floatingActionButton: Transform.translate(
        // Generate 버튼 있는 곳
        offset: const Offset(0, 8),
        child: IconButton(
          icon: SvgPicture.asset(
            'assets/images/D_generate_button.svg',
            height: 86.46,
            width: 86.46,
          ),
          onPressed: () {
            if (selectedFilter == Filter.none) {
              _noneFilter();
            } else {
              final List<int> indexList = [];
              for (Diary diary in selectedDiary) {
                indexList.add(allDiary.indexOf(diary));
                //ref.read(diaryProvider.notifier).editTodayDiary(diary.text,a, diary.date,true);
              }
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) {
                  Diary combinedDiary = selectedDiary.reduce((diary1, diary2) {
                    return Diary(
                        date: diary1.date,
                        text: '${diary1.text} \n +${diary2.text}');
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
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyBottomAppBar2(),
    );
  }
}
