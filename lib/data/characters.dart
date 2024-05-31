import 'package:flutter/material.dart';
import 'package:capstone/models/character.dart';
import 'package:capstone/models/chapter.dart';
import 'package:capstone/providers/filter_provider.dart';

List<Character> charList = [
  Character(
      //char_img: 'assets/images/char_yangkee.svg',
      charImg: 'assets/images/char/yangkee.jpg',
      name: '귀여운 것은 곧 사랑이다',
      filter: Filter.yangkee,
      alpha: 255,
      red: 184,
      green: 44,
      blue: 111,
      chapters: [
        Chapter(
          chImg: 'assets/images/chapter2.png',
          title: 'Chapter 2',
          text: '',
        ),
      ]),
  Character(
      //char_img: 'assets/images/char_myao.svg',
      charImg: 'assets/images/char/myao-maa.jpg',
      name: '먀오마아의 은밀한 취미생활',
      filter: Filter.myaomah,
      name: "",
      alpha: 255,
      red: 48,
      green: 70,
      blue: 102,
      chapters: [
        Chapter(
          chImg: 'assets/images/chapter1.png',
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
          chImg: 'assets/images/chapter2.png',
          title: 'Chapter 2',
          text: '',
        ),
      ]),
  Character(
      //char_img: 'assets/images/char_mung.svg',
      charImg: 'assets/images/char/kim-mung.jpg',
      name: '우리도 모르는 우리들의 별빛',
      filter: Filter.kimmunng,
      name: "",
      alpha: 255,
      red: 39,
      green: 113,
      blue: 130,
      chapters: [
        Chapter(
          chImg: 'assets/images/chapter1.png',
          title: 'Chapter 1',
          text: '',
        ),
      ]),
  Character(
<<<<<<< HEAD
      //charImg: 'assets/images/char_yangkee.svg',
      charImg: 'assets/images/char_yangkee.png',
      filter: Filter.yangkee,
      alpha: 255,
      name: "",
      red: 244,
      green: 41,
      blue: 139,
      chapters: [
        Chapter(
          chImg: 'https://picsum.photos/250?image=9',
          title: 'Chapter 2',
          text: '',
        ),
      ]),
  Character(
      //charImg: 'assets/images/char_pooh.svg',
      charImg: 'assets/images/char_pooh.png',
      filter: Filter.pooh,
      alpha: 255,
      red: 12,
      green: 245,
      name: "",
      blue: 174,
=======
      //char_img: 'assets/images/char_pooh.svg',
      charImg: 'assets/images/char/winnie the pooh.jpg',
      name: 'Winnie the Pooh',
      filter: Filter.pooh,
      alpha: 255,
      red: 66,
      green: 139,
      blue: 117,
>>>>>>> 9ff739e1b36a3af254262f4b1b785c829b44a10c
      chapters: [
        Chapter(
          chImg: 'assets/images/chapter2.png',
          title: 'Chapter 1',
          text: '',
        ),
      ]),
  Character(
<<<<<<< HEAD
      //charImg: 'assets/images/char_leesang.svg',
      charImg: 'assets/images/char_leesang.png',
      filter: Filter.leesang,
      alpha: 255,
      red: 240,
      name: "",
      green: 240,
      blue: 238,
      chapters: []),
  Character(
      //charImg: 'assets/images/char_henry.svg',
      charImg: 'assets/images/char_henry.png',
      filter: Filter.henry,
      alpha: 255,
      name: "",
      red: 13,
      green: 92,
      blue: 64,
      chapters: []),
=======
      //char_img: 'assets/images/char_henry.svg',
      charImg: 'assets/images/char/Henry DT.jpg',
      name: '숲 속을 거닐다',
      filter: Filter.henry,
      alpha: 255,
      red: 29,
      green: 76,
      blue: 58,
      chapters: [
        Chapter(
          chImg: 'assets/images/chapter2.png',
          title: 'Chapter 1',
          text: '',
        ),
      ]),
  Character(
      //char_img: 'assets/images/char_leesang.svg',
      charImg: 'assets/images/char/lee sang.jpg',
      name: '동생 보아라',
      filter: Filter.leesang,
      alpha: 255,
      red: 216,
      green: 209,
      blue: 187,
      chapters: [
        Chapter(
          chImg: 'assets/images/chapter2.png',
          title: 'Chapter 1',
          text: '',
        ),
      ]),
  Character(
      charImg: 'assets/images/char/alsoubet.jpg',
      name: '그리스 앞바다',
      filter: Filter.alsoubet,
      alpha: 255,
      red: 181,
      green: 163,
      blue: 85,
      chapters: [
        Chapter(
          chImg: 'assets/images/chapter2.png',
          title: 'Chapter 1',
          text: '',
        ),
      ]),
  Character(
      charImg: 'assets/images/char/monk.jpg',
      name: '동자청풍',
      filter: Filter.irae,
      alpha: 255,
      red: 244,
      green: 168,
      blue: 79,
      chapters: [
        Chapter(
          chImg: 'assets/images/chapter2.png',
          title: 'Chapter 1',
          text: '',
        ),
      ]),
  Character(
      charImg: 'assets/images/char/Jangseung.jpg',
      name: '풍하마을 수호 장승',
      filter: Filter.jangseung,
      alpha: 255,
      red: 198,
      green: 79,
      blue: 93,
      chapters: [
        Chapter(
          chImg: 'assets/images/chapter2.png',
          title: 'Chapter 1',
          text: '',
        ),
      ]),
  Character(
      charImg: 'assets/images/char/florist.jpg',
      name: '심연의 화원',
      filter: Filter.yeonhwa,
      alpha: 255,
      red: 191,
      green: 34,
      blue: 81,
      chapters: [
        Chapter(
          chImg: 'assets/images/chapter2.png',
          title: 'Chapter 1',
          text: '',
        ),
      ]),
  Character(
      charImg: 'assets/images/char/grandmother.jpg',
      name: '할머니',
      filter: Filter.grandma,
      alpha: 255,
      red: 110,
      green: 0,
      blue: 178,
      chapters: [
        Chapter(
          chImg: 'assets/images/chapter2.png',
          title: 'Chapter 1',
          text: '',
        ),
      ]),
>>>>>>> 9ff739e1b36a3af254262f4b1b785c829b44a10c
];
