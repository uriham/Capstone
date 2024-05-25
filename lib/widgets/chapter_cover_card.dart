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
      margin: const EdgeInsets.fromLTRB(0, 130, 0, 160),
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
      child:
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 360,
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
    );
  }
}
