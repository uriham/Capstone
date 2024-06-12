import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:capstone/widgets/chapter_cover_card.dart';
import 'package:capstone/screens/chapter_cover.dart';
import 'package:capstone/screens/mybook_read.dart';
import 'package:flutter/material.dart';
import 'package:capstone/models/character.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Book 클래스
class CharCoverCard extends StatefulWidget {
  const CharCoverCard({super.key, required this.char});
  final Character char;

  @override
  State<CharCoverCard> createState() => _CharCoverCardState();
}

class _CharCoverCardState extends State<CharCoverCard> {
  final chapController = PageController(viewportFraction: 1.0, keepPage: true);

  bool _animate = false;
  final double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(microseconds: 100), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //timeDilation = 5.0;

    return Container(
      //margin: const EdgeInsets.fromLTRB(0, 0, 0, 150),
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 60),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: _animate
                ? [Colors.transparent, widget.char.color]
                : [Colors.transparent, Colors.transparent],
            center: Alignment.center,
            stops: const [0.1, 1.0],
            radius: 0.05,
            focalRadius: 1.1,
            focal: const Alignment(0.0, 0.0),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(1, 2),
                    )
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChapCoverScreen(
                          char: widget.char,
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 268,
                    height: 383,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      //child: SvgPicture.asset(char.char_img),
                      child: Image.asset(widget.char.charImg),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Text(
                widget.char.filter.name,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              // const SizedBox(height: 15),
              // Text(
              //   widget.book.title,
              //   style: const TextStyle(fontSize: 18, color: Colors.white),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
