import 'package:flutter/material.dart';
import 'package:capstone/models/chapter.dart';

class Character {
  final String charImg;
  final String name;
  final Color color;
  List<Chapter> chapters;

  Character({
    required this.charImg,
    required this.name,
    required int alpha,
    required int red,
    required int green,
    required int blue,
    required this.chapters,
  }) : color = Color.fromARGB(alpha, red, green, blue);

  Character changeChapters(List<Chapter> chapterList){
    final myChapters = chapterList;
    return Character(charImg: charImg, name: name, alpha: color.alpha, red: color.red, green: color.green, blue: color.blue, chapters: myChapters);
  }
}


