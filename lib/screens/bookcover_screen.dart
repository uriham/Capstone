import 'package:capstone/models/chapter.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/book_provider.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:capstone/providers/user_provider.dart';
import 'package:capstone/screens/bookcover_loading.dart';
import 'package:capstone/providers/filter_provider.dart';
import 'package:capstone/screens/chapter_cover.dart';
import 'package:capstone/widgets/bookcover_button.dart';
import 'package:flutter/material.dart';
import 'package:capstone/data/characters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/screens/character_cover.dart';
import 'package:capstone/screens/tab.dart';

class BookCoverScreen extends ConsumerStatefulWidget {
  const BookCoverScreen(
      {super.key,
      required this.selectedDiary,
      required this.indexList,
      required this.nowFilter});

  final Diary selectedDiary;
  final List<int> indexList;
  final Filter nowFilter;

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
    final username = ref.watch(userProvider).name;

    final booklist = await Navigator.of(context)
        .push<List<String>>(MaterialPageRoute(builder: (ctx) {
      return BookCoverLoading(
        keyword: _keywordController.text,
        selectedDiary: widget.selectedDiary,
        filterNumber: widget.nowFilter.number,
        username: username,
      );
    }));
    setState(() {
      bookInfo = booklist ??
          [
            'https://picsum.photos/250?image=9',
            'awds'
          ]; //bookinfo는 appi통신으로 가져온 url과 text이다. 0 이 url, 1이 text
      isGenerated = true;
    });
  }

  void _bookprovider() {
    for (int i in widget.indexList) {
      ref.read(diaryProvider.notifier).useDiary(i);
      ref.read(diaryProvider.notifier).changeFilter(i, widget.nowFilter);
    }
    ref.read(bookProvider.notifier).addChapter(
        widget.nowFilter,
        Chapter(
            chImg: bookInfo[0],
            title: bookTitle,
            text: bookInfo[1],
            date: widget.selectedDiary.date)); // 책 생성
    final myCharacter =
        ref.read(bookProvider.notifier).getCharacter(widget.nowFilter);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ChapCoverScreen(char: myCharacter)));
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent = Column(
      children: [
        const SizedBox(
          height: 130,
        ),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFFF2287), Color.fromARGB(255, 255, 255, 255)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            '원하시는 그림을 요청해보세요!\nAi가 그려드립니다',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.3,
              color: Colors.white,
              fontSize: 22,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '자세하게 작성할수록 더 나은 표지가 생성됩니다',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
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
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(0.800000011920929),
                contentPadding: const EdgeInsets.fromLTRB(3, 1, 1, 1),
                hintText: '   텍스트를 입력하세요',
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0x19D9D9D9)),
                    borderRadius: BorderRadius.circular(13))),
            style: const TextStyle(color: Colors.white),
            controller: _titleController,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        TextField(
          maxLines: 7,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(11),
              hintText: '텍스트를 입력하세요',
              counterText: '',
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.white.withOpacity(0.800000011920929),
                  ),
                  borderRadius: BorderRadius.circular(13))),
          style: const TextStyle(color: Colors.white),
          controller: _keywordController,
        ),
        const SizedBox(
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
                      return const TabScreen();
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
        buttonText: isGenerated ? '완성' : '그려내기',
      ),
    );
  }
}
