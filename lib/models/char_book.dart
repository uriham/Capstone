import 'package:flutter/cupertino.dart';
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
class CharCover extends StatefulWidget {
  final Character char;

  CharCover({super.key, required this.char});
  _CharCoverState createState() => _CharCoverState();
}

class _CharCoverState extends State<CharCover> {
  //final chapController = PageController(viewportFraction: 1.0, keepPage: true);

  bool _animate = false;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(microseconds: 100), () {
      setState(() {
        _animate = true;
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //timeDilation = 5.0;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 100),
      //padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.white,
      //     width: 1.0,
      //   ),
      // ),
      child: AnimatedContainer(
        // margin: const EdgeInsets.fromLTRB(0, 60, 0, 70),
        // padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
        // width: 323,
        // height: 458,
        duration: Duration(seconds: 3),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: _animate
                ? [Colors.transparent, widget.char.color]
                : [Colors.transparent, Colors.transparent],
            center: Alignment.center,
            stops: [0.2, 1.0],
            radius: 0.07,
            focalRadius: 1.0,
            focal: Alignment(0.0, 0.0),
          ),
          //borderRadius: const BorderRadius.all(Radius.circular(50)),
          // border: Border.all(
          //   color: Colors.white,
          //   width: 1.0,
          // ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  AnimatedOpacity(
                    opacity: _opacity,
                    duration: Duration(seconds: 5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChapCoverScreen(char: widget.char),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 268,
                        height: 383,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          //child: SvgPicture.asset(char.char_img),
                          child: Image.asset(widget.char.char_img),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.char.name,
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
        ),
      ),
    );
  }
}
