import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:prism_test/models/chapter_cover.dart';
import 'package:prism_test/screens/chapter_screen.dart';
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
  double focalRad = 1.1;

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

    if (widget.char.color.green < 80) {
      focalRad = 1.25;
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 60),
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
                ? [Color.fromARGB(1, 14, 14, 14), widget.char.color]
                : [Colors.transparent, Colors.transparent],
            center: Alignment.center,
            stops: [0.1, 1.0],
            radius: 0.05,
            focalRadius: 1.1,
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(1, 2),
                        )
                      ],
                    ),
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
                        width: 285,
                        height: 405,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          //child: SvgPicture.asset(char.char_img),
                          child: Image.asset(widget.char.char_img),
                        ),
                      ),
                    ),
                  ),
                  // AnimatedOpacity(
                  //   opacity: _opacity,
                  //   duration: Duration(milliseconds: 300),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) =>
                  //               ChapCoverScreen(char: widget.char),
                  //         ),
                  //       );
                  //     },
                  //     child: SizedBox(
                  //       width: 268,
                  //       height: 383,
                  //       child: ClipRRect(
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(20)),
                  //         //child: SvgPicture.asset(char.char_img),
                  //         child: Image.asset(widget.char.char_img),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 30),
                  Text(
                    widget.char.name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageShadow {
  final Widget child;
  final double opacity;
  final double sigma;
  final Color color;
  final Offset offset;

  ImageShadow({
    required this.child,
    this.opacity = 0.5,
    this.sigma = 2,
    this.color = Colors.black,
    this.offset = const Offset(2, 2),
  });
}
