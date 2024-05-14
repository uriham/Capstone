import 'package:flutter/material.dart';

class Character {
  final String char_img;
  final String name;
  final Color color;
  final List<Chapter> chapters;

  Character({
    required this.char_img,
    required this.name,
    required int alpha,
    required int red,
    required int green,
    required int blue,
    required this.chapters,
  }) : color = Color.fromARGB(alpha, red, green, blue);
}

class Chapter {
  final String ch_img;
  final String title;
  final String text;

  Chapter({
    required this.ch_img,
    required this.title,
    required this.text,
  });
}

List<Character> charList = [
  Character(
      char_img: 'assets/images/myao.png',
      name: 'MyaoMah',
      alpha: 1,
      red: 64,
      green: 105,
      blue: 205,
      chapters: [
        Chapter(
          ch_img: 'assets/images/chapter1.png',
          title: 'Chapter 1',
          text:
              '''어느 늦가을 아침, 햇살은 창가를 스쳐 지나 내 방을 은은하게 비추었다. 나는 이불 속에서 꿈속 세상을 맴돌다가 새소리에 눈을 떴다. 아직 잠을 더 청하며 이불 속에 머무르고 싶었지만, 어쩔 수 없이 일어나야겠다는 생각이 들었다.

침대에서 나와 커튼을 걷어내니, 눈부신 햇살이 내 눈을 찔렀다. 창문을 열고 시원한 가을 바람을 마시며, 나는 오늘 하루를 시작할 준비를 했다.

아침 식사를 마치고 학교를 향해 발걸음을 옮겼다. 학교까지 가는 길은 단풍잎으로 가득 차 있었다. 붉고 노란 단풍잎들이 아름다운 풍경을 만들어내고 있었고, 나는 그 풍경에 매료되어 천천히 걸었다.

학교에 도착하여 수업에 참여했다. 오늘 수업은 흥미진진했다. 특히 역사 수업에서 고대 이집트 문명에 대해 배우는 것은 매우 흥미로웠다.

점심시간에는 친구들과 함께 식당에 가서 식사를 했다. 우리는 맛있는 음식을 먹으며 서로의 이야기를 나누었다. 친구들과 함께 시간을 보내는 것은 언제나 즐거운 일이었다.
오후에는 학교 도서관에 들러 책을 읽었다. 나는 소설책을 읽는 것을 좋아한다. 책 속 주인공이 되어 다른 세상을 경험하는 것은 매우 흥미로운 일이다.

저녁에는 가족들과 함께 저녁 식사를 했다. 우리는 오늘 하루 있었던 일들을 이야기하며 즐거운 시간을 보냈다.
저녁 식사 후에는 숙제를 해야 했다. 나는 숙제를 빨리 끝내고 싶었지만, 생각보다 어려웠고 늦게까지 숙제를 하게 되었다.
드디어 숙제를 끝내고 잠자리에 들었다. 오늘 하루는 꽤 피곤했지만,''',
        ),
        Chapter(
          ch_img: 'assets/images/chapter2.png',
          title: 'Chapter 2',
          text: '',
        ),
      ]),
  Character(
      char_img: 'assets/images/myao.png',
      name: 'student',
      alpha: 1,
      red: 60,
      green: 184,
      blue: 213,
      chapters: [
        Chapter(
          ch_img: 'assets/images/chapter1.png',
          title: 'Chapter 1',
          text: '',
        ),
      ]),
  Character(
      char_img: 'assets/images/myao.png',
      name: 'gang',
      alpha: 1,
      red: 244,
      green: 41,
      blue: 139,
      chapters: [
        Chapter(
          ch_img: 'assets/images/chapter2.png',
          title: 'Chapter 2',
          text: '',
        ),
      ]),
  // Character(
  //     char_img: 'assets/images/myao.png',
  //     name: 'Pooh',
  //     alpha: 1,
  //     red: 12,
  //     green: 245,
  //     blue: 174,
  //     chapters: [
  //       Chapter(
  //         ch_img: 'ch_img',
  //         title: 'Chapter 1',
  //         text: '',
  //       ),
  //     ]),
  // Character(
  //     char_img: 'assets/images/myao.png',
  //     name: 'LeeSang',
  //     alpha: 1,
  //     red: 240,
  //     green: 240,
  //     blue: 238,
  //     chapters: [
  //       Chapter(
  //         ch_img: 'ch_img',
  //         title: 'Chapter 1',
  //         text: '',
  //       ),
  //     ]),
  // Character(
  //     char_img: 'assets/images/myao.png',
  //     name: 'Henry',
  //     alpha: 1,
  //     red: 13,
  //     green: 92,
  //     blue: 64,
  //     chapters: [
  //       Chapter(
  //         ch_img: 'ch_img',
  //         title: 'Chapter 1',
  //         text: '',
  //       ),
  //     ]),
];