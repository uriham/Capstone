import 'package:capstone/providers/diary_provider.dart';
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
import 'package:capstone/screens/tutorial_screen.dart';
import 'package:capstone/screens/calendar.dart';
import 'package:capstone/screens/diary_page.dart';

class TapScreen extends ConsumerWidget {
  final String userName;
  final String? selectedImage;

  const TapScreen({
    Key? key,
    required this.userName,
    this.selectedImage,
  }) : super(key: key);

  Future<void> _showCalendar(BuildContext context) async {
    final selectedDate = await showModalBottomSheet<DateTime?>(
      context: context,
      builder: (ctx) => const CalendarWidget(),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
    );

    if (selectedDate != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return DiaryPage(
            date: selectedDate); // Navigate to DiaryPage with selected date
      }));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDiary = ref.watch(diaryProvider);
    final selectedDiary = ref.watch(selectedDiarysProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return Profile(userName: userName);
              }));
            },
            child: Row(
              children: const [
                Text('Diary', style: TextStyle(fontSize: 20)),
                SizedBox(width: 10),
                Icon(Icons.circle),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _showCalendar(context),
          ),
        ],
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
        userName: userName,
      ),
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 8),
        child: IconButton(
          icon: SvgPicture.asset(
            'assets/images/D_generate_button.svg',
            height: 86.46,
            width: 86.46,
          ),
          onPressed: () {
            final List<int> indexList = [];
            for (Diary diary in selectedDiary) {
              indexList.add(allDiary.indexOf(diary));
            }

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) {
                Diary combinedDiary = selectedDiary.reduce((diary1, diary2) {
                  return Diary(
                    date: diary1.date,
                    text: '${diary1.text} \n${diary2.text}',
                  );
                });
                return BookCoverScreen(
                  indexList: indexList,
                  selectedDiary: combinedDiary,
                  userName: userName,
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
