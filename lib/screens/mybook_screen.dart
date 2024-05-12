import 'package:flutter/material.dart';
import 'package:prism_test/models/book_card.dart';
import 'package:prism_test/models/book_example.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// MybookScreen 클래스
class MybookScreen extends StatelessWidget {
  MybookScreen({
    super.key,
  });

  final controller = PageController(viewportFraction: 1.0, keepPage: true);

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
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView.builder(
                    controller: controller,
                    itemCount: bookList.length,
                    itemBuilder: (context, index) {
                      final book = bookList[index];
                      return BookCard(book: book);
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
