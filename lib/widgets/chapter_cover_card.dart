import 'package:capstone/models/character.dart';
import 'package:capstone/screens/chapter_read.dart';
import 'package:flutter/material.dart';
import 'package:capstone/widgets/photo_hero.dart';
import 'package:capstone/models/chapter.dart';

// Book 클래스
class ChapterCoverCard extends StatelessWidget {
  final Chapter chap;
  final Character character;
  const ChapterCoverCard(
      {super.key, required this.chap, required this.character});

  @override
  Widget build(BuildContext context) {
    //timeDilation = 5.0;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 100),
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 238,
                height: 360,
                decoration: BoxDecoration(
                    //border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(1, 2),
                      )
                    ]),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: PhotoHero(
                      //tag로 URL넣음
                      //width: 268,
                      photo: chap.chImg,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(builder: (context) {
                            return ChapReaderPage(
                              chap: chap,
                              character: character,
                            );
                          }),
                        );
                      }),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                chap.title,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
