import 'package:capstone/screens/add_book.dart';
import 'package:flutter/material.dart';
import 'package:capstone/widgets/diary_card.dart';
import 'package:capstone/models/diary.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key, required this.todayDiary});

  final List<Diary> todayDiary;


  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool _isLongTaped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 60), // 위쪽 여백 추가
          const Text(
            '안녕하세요 \nUser님',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'KoPubWorldDotum_Pro',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const AddBookScreen();
              }));
            },
            child: Container(
              width: double.infinity,
              height: 93,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.10000000149011612),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF414141)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(
                'assets/images/D_PRISM_ic.svg',
                width: 30,
                height: 30,
              ),
              const Text(
                '  오늘의 기록',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(child: DiaryCard(todayDiary: widget.todayDiary[index],index: index,isLongTaped: _isLongTaped,),onLongPress: (){setState(() {
                _isLongTaped = !_isLongTaped;
              });},);
            },
            itemCount: widget.todayDiary.length,
          )),

          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}


/*
class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.todayDiary});

  final List<Diary> todayDiary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 60), // 위쪽 여백 추가
          const Text(
            '안녕하세요 \nUser님',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'KoPubWorldDotum_Pro',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const AddBookScreen();
              }));
            },
            child: Container(
              width: double.infinity,
              height: 93,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.10000000149011612),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF414141)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(
                'assets/images/D_PRISM_ic.svg',
                width: 30,
                height: 30,
              ),
              const Text(
                '  오늘의 기록',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return DiaryCard(todayDiary: todayDiary[index],index: index,);
            },
            itemCount: todayDiary.length,
          )),

          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
*/