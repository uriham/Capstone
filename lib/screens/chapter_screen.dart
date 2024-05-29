import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final controller = PageController(viewportFraction: 0.6, keepPage: true);
  var _selectedIndex = 0;
  Color whiteOp = Colors.white.withOpacity(0.55);

  @override
  Widget build(BuildContext context) {
    //final bookList = ref.watch(bookProvider);

    if (widget.char.chapters.isEmpty) {
      return const Center(
        child: Text(
          'Oh, there is no book here',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    if (widget.char.color.green < 80) {
      whiteOp = Colors.white.withOpacity(0.35);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: SvgPicture.asset('assets/images/C_E_back_ic.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.char.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'KoPubWorldDotum_Pro',
          ),
        ),
        backgroundColor: widget.char.color,
      ),
      // body: Container(
      //   color: Colors.blue,
      // ),
      body: Container(
        decoration: BoxDecoration(
          color: widget.char.color,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              height: 600,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.white,
                //   width: 1.0,
                // ),
                gradient: RadialGradient(
                  colors: [whiteOp, Colors.white.withOpacity(0.0)],
                  stops: [0.1, 0.9],
                  center: Alignment.center,
                  radius: 0.75,
                  focalRadius: 0.8,
                ),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
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
                      var _scale = _selectedIndex == index ? 1.2 : 1.0;
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
            ),
            SizedBox(),
            SmoothPageIndicator(
              controller: controller,
              count: widget.char.chapters.length,
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
    );
  }
}
