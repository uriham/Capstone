import 'package:capstone/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:capstone/widgets/char_cover_card.dart';
import 'package:capstone/screens/tab.dart';
import 'package:capstone/widgets/chapter_cover_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CharCoverScreen extends ConsumerStatefulWidget {
  const CharCoverScreen({
    Key? key,
    required this.selectedImage,
  }) : super(key: key);

  final String? selectedImage;

  @override
  _CharCoverScreenState createState() => _CharCoverScreenState();
}

class _CharCoverScreenState extends ConsumerState<CharCoverScreen> {
  final _controller = PageController(
    viewportFraction: 1,
    keepPage: true,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final characterList = ref.watch(bookProvider);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) => TabScreen(
              userName: AutofillHints.username,
              selectedImage: widget.selectedImage,
            ),
          ),
        );
        return false;
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
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: characterList.length,
                effect: const ScrollingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
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
