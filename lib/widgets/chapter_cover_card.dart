import 'package:flutter/scheduler.dart';
import 'package:capstone/screens/chapter_read.dart';
import 'package:flutter/material.dart';
import 'package:capstone/widgets/photo_hero.dart';
import 'package:capstone/models/chapter.dart';

// Book 클래스
class ChapterCoverCard extends StatelessWidget {
  final Chapter chap;

  const ChapterCoverCard({super.key, required this.chap});

  @override
  Widget build(BuildContext context) {
    //timeDilation = 5.0;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 160, 0, 160),
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
      // width: 323,
      // height: 458,
      decoration: const BoxDecoration(
          //   //borderRadius: const BorderRadius.all(Radius.circular(50)),
          //   gradient: RadialGradient(
          //     colors: [
          //       Colors.white.withOpacity(0.5),
          //       Colors.white.withOpacity(0.1)
          //     ],
          //     stops: [0.1, 0.9],
          //     center: Alignment.center,
          //     radius: 0.5,
          //     focalRadius: 0.7,
          //     //focal: Alignment(0.0, 0.0),
          //   ),
          // border: Border.all(
          //   color: Colors.white,
          //   width: 1.0,
          // ),
          ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  //child: Image.asset(chap.ch_img),
                  child: PhotoHero( //tag로 URL넣음
                      //width: 268,
                      photo: chap.chImg,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(builder: (context) {
                            return ChapReaderPage(chap: chap);
                          }),
                        );
                      }),
                ),
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
