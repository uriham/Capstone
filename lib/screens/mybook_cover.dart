import 'package:flutter/material.dart';
import 'package:prism_test/models/book_card.dart';
import 'package:prism_test/models/book_example.dart';
import 'package:prism_test/models/char_book.dart';
import 'package:prism_test/models/character.dart';
import 'package:prism_test/models/chapter_cover.dart';
import 'package:prism_test/models/diary.dart';
import 'package:prism_test/screens/diary_read.dart';
import 'package:prism_test/screens/test_home.dart';
import 'package:prism_test/widgets/glowingdot.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// MybookScreen 클래스
class CharCoverScreen extends StatelessWidget {
  CharCoverScreen({
    super.key,
  });

  final controller = PageController(viewportFraction: 0.99, keepPage: true);

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
        actions: [
          // IconButton(
          //   icon: Icon(Icons.bubble_chart),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => GlowingCirclesBackground()),
          //     );
          //   },
          // ),
          IconButton(
            icon: Icon(Icons.heat_pump_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
      ),
      body:
          // Container(
          //   margin: const EdgeInsets.fromLTRB(5, 20, 5, 100),
          //   // decoration: BoxDecoration(
          //   //   color: Colors.white,
          //   // ),
          //   child:
          SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                //width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView.builder(
                    controller: controller,
                    itemCount: charList.length,
                    itemBuilder: (context, index) {
                      final charBook = charList[index];
                      return CharCover(char: charBook);
                    }),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: charList.length,
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
