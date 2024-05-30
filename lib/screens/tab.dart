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
    required this.userName,
    required this.selectedImage,
  });
  final String userName;
  final String? selectedImage; // 추가: 이미지 경로를 저장할 변수

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
    void pressGenerate() {
      if (selectedFilter == Filter.none) {
        _noneFilter();
      } else {
        final List<int> indexList = [];
        for (Diary diary in selectedDiary) {
          indexList.add(allDiary.indexOf(diary));
        }
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
              userName: widget.userName,
            );
          }),
        );
        ref.read(selectedDiarysProvider.notifier).deleterAllDiary();
      }
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          // 우측 정렬을 위한 Spacer 추가
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return Profile(
                  userName: widget.userName,
                  selectedImage: widget.selectedImage,
                ); // Pass userName to Profile screen
              }));
            },
            child: const Icon(Icons.circle),
          ),
        ],
        title: Text(
          "Diary",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'KoPubWorldDotum_Pro',
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: StartScreen(
        userName: widget.userName, // Pass userName to StartScreen
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
                    userName: widget.userName,
                  );
                }),
              );
              ref.read(selectedDiarysProvider.notifier).deleterAllDiary();
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyBottomAppBar(),
    );
  }
}
