import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prism_test/screens/chapter_read.dart';
import 'package:flutter/material.dart';
import 'package:prism_test/models/photo_hero.dart';
import 'package:prism_test/models/character.dart';

// Book 클래스
class ChapterBook extends StatelessWidget {
  final Chapter chap;

  const ChapterBook({super.key, required this.chap});

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 60, 0, 80),
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
        // gradient: RadialGradient(
        //   colors: [Colors.transparent],
        //   center: Alignment.center,
        //   stops: [0.2, 1.0],
        //   radius: 0.1,
        //   focalRadius: 1.0,
        //   focal: Alignment(0.0, 0.0),
        // ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                //child: Image.asset(chap.ch_img),
                child: PhotoHero(
                    //width: 268,
                    photo: chap.ch_img,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(builder: (context) {
                          return ChapReaderPage(chap: chap);
                        }),
                      );
                    }),
              ),
              const SizedBox(height: 10),
              Text(
                chap.title,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
