import 'package:flutter/material.dart';
import 'package:prism_test/models/char_book.dart';
import 'package:prism_test/models/character.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// MybookScreen 클래스
class CharCoverScreen extends StatelessWidget {
  CharCoverScreen({
    super.key,
  });

  final controller = PageController(viewportFraction: 1.0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    //final bookList = ref.watch(bookProvider);

    // if (charList.isEmpty) {
    //   return const Center(
    //     child: Text(
    //       'Oh, there is no book here',
    //       style: TextStyle(color: Colors.white),
    //     ),
    //   );
    // }

    return Scaffold(
      backgroundColor: Color.fromARGB(1, 14, 14, 14),
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
        //elevation: 0.0,
      ),
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView.builder(
                    controller: controller,
                    itemCount: charList.length,
                    itemBuilder: (context, index) {
                      final char = charList[index];
                      return CharCover(char: char);
                    }),
              ),
              SizedBox(height: 30),
              SmoothPageIndicator(
                controller: controller,
                count: charList.length,
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
