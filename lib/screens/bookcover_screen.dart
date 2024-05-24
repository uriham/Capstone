import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:capstone/screens/bookcover_loading.dart';
import 'package:capstone/providers/book_provider.dart';
import 'package:capstone/widgets/bookcover_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/screens/mybook_screen.dart';
import 'package:capstone/screens/tab.dart';

class BookCoverScreen extends ConsumerStatefulWidget {
  const BookCoverScreen({
    Key? key,
    required this.selectedDiary,
    required this.indexList,
    required this.userName,
  }) : super(key: key);

  final Diary selectedDiary;
  final List<int> indexList;
  final String userName;

  @override
  ConsumerState<BookCoverScreen> createState() => _BookCoverScreenState();
}

class _BookCoverScreenState extends ConsumerState<BookCoverScreen> {
  final _titleController = TextEditingController();
  final _keywordController = TextEditingController();
  List<String> bookInfo = [];
  bool isGenerated = false;
  String bookTitle = '';
  String? _selectedImage;

  void _goCompleteScreen() async {
    bookTitle = _titleController.text;

    final booklist = await Navigator.of(context).push<List<String>>(
      MaterialPageRoute(builder: (ctx) {
        return BookCoverLoading(
          keyword: _keywordController.text,
          selectedDiary: widget.selectedDiary,
        );
      }),
    );
    if (booklist != null) {
      setState(() {
        bookInfo = booklist;
        isGenerated = true;
      });
    }
  }

  void _bookProvider() {
    for (int i in widget.indexList) {
      ref.read(diaryProvider.notifier).useDiary(i);
    }
    ref.read(bookProvider.notifier).addBook(
          bookInfo[1],
          bookInfo[0],
          widget.selectedDiary.date,
          bookTitle,
        );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MybookScreen(userName: widget.userName),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent = Column(
      children: [
        SizedBox(
          height: 130,
        ),
        Text(
          '원하시는 그림을 요청해보세요!\nAi가 그려드립니다',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFFFF2287),
            fontSize: 22,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 1,
          ),
        ),
        SizedBox(height: 4),
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
        SizedBox(
          height: 80,
        ),
        Align(
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
            controller: _titleController,
          ),
        ),
        SizedBox(
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
        SizedBox(
          height: 150,
        ),
      ],
    );

    if (isGenerated) {
      bodyContent = Container(
        width: 268,
        height: 383,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(bookInfo[0]),
            fit: BoxFit.fill,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Spacer(),
          isGenerated
              ? SizedBox()
              : TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) {
                        return TapScreen(
                          userName: widget.userName,
                          selectedImage: _selectedImage,
                        );
                      }),
                    );
                  },
                  child: const Icon(Icons.close, color: Colors.white),
                )
        ],
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
              bodyContent, // 주력 내용을 전달함
              BookCoverButton(
                onTap: isGenerated ? _bookProvider : _goCompleteScreen,
                buttonText: isGenerated ? '완성' : '그려내기~',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
