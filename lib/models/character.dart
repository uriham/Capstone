import 'package:flutter/material.dart';
import 'package:capstone/models/chapter.dart';
import 'package:capstone/providers/filter_provider.dart';

class Character {
  final String charImg;
  final Filter filter;
  final Color color;
  final String name;
  List<Chapter> chapters;

  Character({
    required this.charImg,
    required this.filter,
    required this.name,
    required int alpha,
    required int red,
    required int green,
    required int blue,
    required this.chapters,
  }) : color = Color.fromARGB(alpha, red, green, blue);

  Character changeChapters(List<Chapter> chapterList) {
    final myChapters = chapterList;
    return Character(
        charImg: charImg,
        filter: filter,
        alpha: color.alpha,
        name: name,
        red: color.red,
        green: color.green,
        blue: color.blue,
        chapters: myChapters);
  }
}
