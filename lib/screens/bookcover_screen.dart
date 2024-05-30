import 'package:capstone/models/chapter.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/book_provider.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:capstone/screens/bookcover_loading.dart';
import 'package:capstone/providers/filter_provider.dart';
import 'package:capstone/widgets/bookcover_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/screens/character_cover.dart';
import 'package:capstone/screens/tab.dart';

class BookCoverScreen extends ConsumerStatefulWidget {
  const BookCoverScreen({
    super.key,
    required this.selectedDiary,
    required this.indexList,
    required this.nowFilter,
    required this.userName,
  });

  final Diary selectedDiary;
  final List<int> indexList;
  final Filter nowFilter;
  final String userName; // userName parameter

  @override
  ConsumerState<BookCoverScreen> createState() => _BookCoverScreenState();
}

class _BookCoverScreenState extends ConsumerState<BookCoverScreen> {
  final _titleController = TextEditingController();
  final _keywordController = TextEditingController();
  List<String> bookInfo = [];
  bool isGenerated = false;
  String bookTitle = '';

  void _goCompleteScreen() async {
    bookTitle = _titleController.text;

    final booklist = await Navigator.of(context)
        .push<List<String>>(MaterialPageRoute(builder: (ctx) {
      return BookCoverLoading(
        keyword: _keywordController.text,
        selectedDiary: widget.selectedDiary,
      );
    }));
    setState(() {
      bookInfo = booklist ??
          [
            'awd',
            'awds'
          ]; //bookinfo는 appi통신으로 가져온 url과 text이다. 0 이 url, 1이 text
      isGenerated = true;
    });
  }

  void _bookprovider() {
    for (int i in widget.indexList) {
      ref.read(diaryProvider.notifier).useDiary(i); //diary사용함 뜨게 만듦
    }
    ref.read(bookProvider.notifier).addChapter(widget.nowFilter,
        Chapter(chImg: bookInfo[0], title: bookTitle, text: bookInfo[1]));
    /*
    ref.read(bookProvider.notifier).addBook(
        bookInfo[1], bookInfo[0], widget.selectedDiary.date, bookTitle);
        */
    /*
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return const MybookScreen();
    }
    ));
    */
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CharCoverScreen()));
  }

  Widget build(BuildContext context) {
    Widget bodyContent = Column(
      children: [
        const SizedBox(
          height: 130,
        ),
        const Text(
          '원하시는 그림을 요청해보세요!\nAi가 그려드립니다',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFFF2287),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.72,
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

    if (isGenerated == true) {
      bodyContent = Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            width: 268,
            height: 420,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage(bookInfo[0]),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          const Spacer(),
          isGenerated
              ? const SizedBox()
              : TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (ctx) {
                      return const TabScreen(
                        userName: AutofillHints.username,
                        selectedImage: '',
                      );
                    }));
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BookCoverButton(
        onTap: isGenerated ? _bookprovider : _goCompleteScreen,
        buttonText: isGenerated ? '완성' : '그려내기~',
      ),
    );
  }
}
