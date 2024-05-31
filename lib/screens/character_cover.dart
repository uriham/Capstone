import 'package:capstone/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:capstone/widgets/char_cover_card.dart';
import 'package:capstone/screens/tab.dart';
import 'package:capstone/widgets/chapter_cover_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// MybookScreen 클래스
class CharCoverScreen extends ConsumerStatefulWidget {
  const CharCoverScreen({
    super.key,
  });

  @override
  ConsumerState<CharCoverScreen> createState() => _CharCoverScreenState();
}

class _CharCoverScreenState extends ConsumerState<CharCoverScreen> {
  final _controller = PageController(
      viewportFraction: 1,
      keepPage: true); // keeppage가 true면 initioal페이지가 아닌 내가 마지막에 본페이지부터 저장됨

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final characterList = ref.watch(bookProvider);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const TabScreen()));
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "My Book",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'KoPubWorldDotum_Pro',
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          //SafeArea는 디바이스의 노치 부분등을 피하게 만들어준다.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView.builder(
                    controller: _controller,
                    itemCount: characterList.length,
                    itemBuilder: (context, index) {
                      final charBook = characterList[index];
                      return CharCoverCard(char: charBook);
                    }),
              ),
              SizedBox(height: 30),
              SmoothPageIndicator(
                controller: _controller,
                count: characterList.length,
                effect: const ScrollingDotsEffect(
                  dotHeight: 6,
                  dotWidth: 6,
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
