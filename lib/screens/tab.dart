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
import 'package:langchain/langchain.dart';

class TabScreen extends ConsumerStatefulWidget{
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TapScreenState();
  }
}

class _TapScreenState extends ConsumerState<TabScreen> {
  

  @override
  Widget build(BuildContext context) {
    final allDiary = ref.watch(diaryProvider);
    final selectedDiary = ref.watch(selectedDiarysProvider);
    final selectedFilter = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        actions: const[Text('Diary',style: TextStyle(fontSize: 20),) ,Spacer(), Icon(Icons.circle),SizedBox(width: 10,)],
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
        nowFilter: selectedFilter,
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
            final List<int> indexList = [];
            for (Diary diary in selectedDiary){
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
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyBottomAppBar(),
    );
  }
}
