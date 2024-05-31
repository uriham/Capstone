import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone/screens/character_cover.dart';
import 'package:capstone/models/character.dart';
import 'package:capstone/widgets/chapter_cover_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// MybookScreen 클래스
class ChapCoverScreen extends StatefulWidget {
  ChapCoverScreen({super.key, required this.char, this.numChap = 0});

  final Character char;
  int numChap;

  @override
  State<ChapCoverScreen> createState() => _ChapCoverScreenState();
}

class _ChapCoverScreenState extends State<ChapCoverScreen> {
  late PageController _pageController;
  late int _selectedIndex;
  Color whiteOp = Colors.white.withOpacity(0.55);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 0.8, keepPage: true, initialPage: widget.numChap);
    _selectedIndex = widget.numChap;
  }

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

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (ctx) => const CharCoverScreen()));
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: SvgPicture.asset('assets/images/C_E_back_ic.svg'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            widget.char.filter.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'KoPubWorldDotum_Pro',
            ),
          ),
          backgroundColor: widget.char.color,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: widget.char.color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: 600,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [whiteOp, Colors.white.withOpacity(0.0)],
                    stops: const [0.1, 0.9],
                    center: Alignment.center,
                    radius: 0.75,
                    focalRadius: 0.8,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    controller: _pageController,
                    itemCount: widget.char.chapters.length,
                    itemBuilder: (context, index) {
                      final chapPage = widget.char.chapters[index];
                      var scale = _selectedIndex == index ? 1.2 : 1.0;
                      //return ChapterBook(chap: chapPage);
                      return TweenAnimationBuilder(
                          tween: Tween(begin: scale, end: scale),
                          duration: const Duration(milliseconds: 200),
                          child: ChapterCoverCard(
                              chap: chapPage, character: widget.char),
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: value,
                              child: child,
                            );
                          });
                    }),
              ),
              const SizedBox(height: 83),
              SmoothPageIndicator(
                controller: _pageController,
                count: widget.char.chapters.length,
                effect: const ScrollingDotsEffect(
                  dotHeight: 6,
                  dotWidth: 6,
                  activeDotColor: Colors.white,
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
