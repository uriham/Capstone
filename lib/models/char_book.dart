import 'package:flutter/widgets.dart';
import 'package:prism_test/models/chapter_cover.dart';
import 'package:prism_test/screens/chapter_screen.dart';
import 'package:prism_test/screens/mybook_read.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:prism_test/models/photo_hero.dart';
import 'package:prism_test/screens/mybook_screen.dart';
import 'package:prism_test/models/character.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Book 클래스
class CharCover extends StatelessWidget {
  final Character char;

  CharCover({super.key, required this.char});

  final chapController = PageController(viewportFraction: 1.0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    //timeDilation = 5.0;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 60, 0, 70),
      padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
      // width: 323,
      // height: 458,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        // border: Border.all(
        //   color: Colors.white,
        //   width: 1.0,
        // ),
        // gradient: LinearGradient(
        //   colors: [_containerColor, Colors.transparent],
        //   begin: Alignment(1.0, 0.5),
        //   end: Alignment(0.0, 0.5),
        // ),
        gradient: RadialGradient(
          colors: [Colors.transparent, char.color],
          center: Alignment.center,
          stops: [0.2, 1.0],
          radius: 0.1,
          focalRadius: 1.0,
          focal: Alignment(0.0, 0.0),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapCoverScreen(char: char),
                    ),
                  );
                },
                child: SizedBox(
                  width: 268,
                  height: 383,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    //child: SvgPicture.asset(char.char_img),
                    child: Image.asset(char.char_img),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                char.name,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              // const SizedBox(height: 15),
              // Text(
              //   widget.book.title,
              //   style: const TextStyle(fontSize: 18, color: Colors.white),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
