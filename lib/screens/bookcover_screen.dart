import 'package:capstone/screens/bookcover_completed_screen.dart';
import 'package:capstone/widgets/bookcover_button.dart';
import 'package:flutter/material.dart';

class BookCoverScreen extends StatefulWidget {
  const BookCoverScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BookCoverScreenState();
  }
}

class _BookCoverScreenState extends State<BookCoverScreen> {
  final _titleController = TextEditingController();
  final _keywordController = TextEditingController();

  void _goCompleteScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return BookCoverComplete(keyword: _titleController.text);
    }));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _keywordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Book Cover',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 130,
              ),
              const Text(
                '원하시는 그림을 요청해보세요!\nAi가 그려드립니다',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFF2287),
                  fontSize: 22,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '자세하게 작성할수록 더 나은 표지가 생성됩니다',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.32,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '책 제목',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.52,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 37,
                padding: const EdgeInsets.only(bottom: 0.21),
                decoration: ShapeDecoration(
                  color: Color(0x19D9D9D9),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.800000011920929),
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _titleController,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                height: 190,
                padding: const EdgeInsets.only(bottom: 1.07),
                decoration: ShapeDecoration(
                  color: const Color(0x19D9D9D9),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.800000011920929),
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _keywordController,
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              BookCoverButton(onTap: _goCompleteScreen,),
            ],
          ),
        ),
      ),
    );
  }
}
