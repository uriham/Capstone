
import 'package:flutter/material.dart';
import 'package:capstone/screens/read_diary_screen.dart';
import 'package:capstone/widgets/diary_show.dart';
import 'package:capstone/data/diarys.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  final todayDiary = allDiarys[0];
  void _changedDiary() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 80), // 위쪽 여백 추가
            const Text(
              '안녕하세요 \nUser님',
              style: TextStyle(fontSize: 39, color: Colors.white),
            ),
            const SizedBox(height: 130),
            const Text(
              '  오늘의 기록',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 5,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => ReadDiaryScreen(
                          todayDiary: todayDiary,
                          onPressed: _changedDiary,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: DiaryShow(
                      todayDiary: todayDiary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );}}
      /*
      bottomNavigationBar: BottomAppBar(
        //height: 70,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu_book),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const MybookScreen()),
                );
              },
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.palette),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const PaletteScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
*/