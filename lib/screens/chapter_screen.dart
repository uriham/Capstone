import 'package:flutter/material.dart';
import 'package:prism_test/models/book_card.dart';
import 'package:prism_test/models/book_example.dart';
import 'package:prism_test/models/char_book.dart';
import 'package:prism_test/models/character.dart';
import 'package:prism_test/models/chapter_cover.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// MybookScreen 클래스
class ChapCoverScreen extends StatefulWidget {
  Character char;
  ChapCoverScreen({super.key, required this.char});

  @override
  _ChapCoverScreenState createState() => _ChapCoverScreenState();
}

class _ChapCoverScreenState extends State<ChapCoverScreen> {
  final controller = PageController(viewportFraction: 0.7, keepPage: true);
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //final bookList = ref.watch(bookProvider);

    if (bookList.isEmpty) {
      return const Center(
        child: Text(
          'Oh, there is no book here',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            widget.char.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'KoPubWorldDotum_Pro',
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      // body: Container(
      //   color: Colors.blue,
      // ),
      body: Container(
        decoration: BoxDecoration(
          color: widget.char.color,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    controller: controller,
                    itemCount: widget.char.chapters.length,
                    itemBuilder: (context, index) {
                      final chapPage = widget.char.chapters[index];
                      var _scale = _selectedIndex == index ? 1.0 : 0.8;
                      //return ChapterBook(chap: chapPage);
                      return TweenAnimationBuilder(
                          tween: Tween(begin: _scale, end: _scale),
                          duration: const Duration(milliseconds: 200),
                          child: ChapterBook(chap: chapPage),
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: value,
                              child: child,
                            );
                          });
                    }),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: bookList.length,
                effect: const ScrollingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.white,
                  //dotColor: Color.fromARGB(1, 217, 217, 217),
                  spacing: 8,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
