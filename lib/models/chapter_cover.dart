import 'package:flutter/scheduler.dart';
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
      margin: const EdgeInsets.fromLTRB(0, 100, 0, 100),
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.white,
      //     width: 1.0,
      //   ),
      // ),
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
