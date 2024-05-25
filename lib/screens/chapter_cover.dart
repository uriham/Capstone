import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone/widgets/char_cover_card.dart';
import 'package:capstone/models/character.dart';
import 'package:capstone/widgets/chapter_cover_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// MybookScreen 클래스
class ChapCoverScreen extends StatefulWidget {
  const ChapCoverScreen({super.key, required this.char});

  final Character char;

  @override
  State<ChapCoverScreen> createState() => _ChapCoverScreenState();
}

class _ChapCoverScreenState extends State<ChapCoverScreen> {
  final controller = PageController(viewportFraction: 0.6, keepPage: true);
  var _selectedIndex = 0;

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
          style: const TextStyle(
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
          //color: widget.char.color,
          //color: Color.fromARGB(255, 48, 70, 102)
          gradient: RadialGradient(
            colors: [Colors.white, widget.char.color],
            stops: const [0.1, 1.0],
            center: Alignment.center,
            radius: 0.55,
            focalRadius: 0.7,
          ),
          // border: Border.all(
          //   color: Colors.white,
          //   width: 1.0,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                    var scale = _selectedIndex == index ? 1.2 : 1.0;
                    //return ChapterBook(chap: chapPage);
                    return TweenAnimationBuilder(
                        tween: Tween(begin: scale, end: scale),
                        duration: const Duration(milliseconds: 100),
                        child: ChapterCoverCard(chap: chapPage),
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
