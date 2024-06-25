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
          date: DateTime.utc(2024, 03, 26),
          chImg:
              'https://i.pinimg.com/originals/3f/f0/18/3ff0182c281737ce1ac801e29d712d22.jpg',
          title: '아주 작은 것들',
          text:
              '''내가 잉태되던 순간에, 아버지든 어머니든, 아니 사실상 이 일에는 두 분이 똑같이 책임이 있으니, 두 분 모두 그때 하시던 일에 제대로 마음을 쓰셨더라면 얼마나 좋았을까 싶다. 당신들께서 그때 하시던 일이 얼마나 중요한 일이고, 얼마나 많은 것들이 그 일이 달려 있는지 충분히 생각해 보셨어야 했다는 말이다. — 거기에는 이성적 인간을 생산하는 일뿐만 아니라, 그 인간의 신체 구성과 기질, 어쩌면 정신적 틀과 능력의 형성까지도 달려 있을 수 있다. — 더욱이 두 분은 혹시 다르게 알고 계셨을지도 모르지만, 그 순간에 가장 활발했던 체액과 기질에 따라 집안 전체의 명운까지도 달라질 수 있다. — 이런 점을 숙고하고 따져 본 다음 그 중요성에 걸맞게 그 일을 진행하셨어야 하는 게 아닌가. — 만약 그랬더라면 나는 독자 여러분이 지금 만나고 있는 현재의 나와는 아주 다른 인물로 세상을 살았을 것이라고 확신한다.''',
        ),
      ]),
  Character(
      //char_img: 'assets/images/char_myao.svg',
      charImg: 'assets/images/char/myao-maa.jpg',
      name: '먀오마아의 은밀한 취미생활',
      filter: Filter.myaomah,
      alpha: 255,
      red: 48,
      green: 70,
      blue: 102,
      chapters: [
        Chapter(
          date: DateTime.utc(2024, 03, 26),
          chImg:
              'https://i.pinimg.com/originals/2d/38/7c/2d387c6a4905bde237ab02681d426339.jpg',
          title: '햇살에 비춘 것들',
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
          date: DateTime.utc(2024, 03, 25),
          chImg:
              'https://i.pinimg.com/originals/7b/01/51/7b0151a38ba362f1e575f1078648d5d3.jpg',
          title: '어른은 왜 힘들까?',
          text:
              '''상처받지 않는 삶은 없다. 상처받지 않고 살아야 행복한 것도 아니다. 누구나 다치면서 살아간다. 우리가 할 수 있고 해야 하는 일은 세상의 그 어떤 날카로운 모서리에 부딪쳐도 치명상을 입지 않을 내면의 힘, 상처받아도 스스로 치유할 수 있는 정신적 정서적 능력을 기르는 것이다. 그 힘과 능력은 인생이 살 만한 가치가 있다는 확신, 사는 방법을 스스로 찾으려는 의지에서 나온다. 그렇게 자신의 인격적 존엄과 인생의 품격을 지켜나가려고 분투하는 사람만이 타인의 위로를 받아 상처를 치유할 수 있으며 타인의 아픔을 위로할 수 있다.''',
        ),
      ]),
  Character(
      //char_img: 'assets/images/char_mung.svg',
      charImg: 'assets/images/char/kim-mung.jpg',
      name: '우리도 모르는 우리들의 별빛',
      filter: Filter.kimmunng,
      alpha: 255,
      red: 39,
      green: 113,
      blue: 130,
      chapters: [
        Chapter(
          date: DateTime.utc(2024, 03, 26),
          chImg:
              'https://i.pinimg.com/originals/ec/7c/cb/ec7ccb589a3f586e1c9fc312f8b35430.jpg',
          title: '빠르게 여유 부리기',
          text:
              '삶이라는 신비롭고 예측 불가능한 현상을 더 많이 즐기기 위해 삶의 비밀을 샅샅이 캐낼 필요는 없다. 완벽하게 이해하지 못한다고 해서 신나게 즐길 수 없는 것은 아니다.',
        ),
      ]),
  Character(
      //char_img: 'assets/images/char_pooh.svg',
      charImg: 'assets/images/char/winnie the pooh.jpg',
      name: 'Winnie the Pooh',
      filter: Filter.pooh,
      alpha: 255,
      red: 66,
      green: 139,
      blue: 117,
      chapters: [
        Chapter(
          date: DateTime.utc(2024, 03, 26),
          chImg:
              'https://i.pinimg.com/originals/f0/90/dd/f090dd61f3f4c4b7737597ec00ab7c69.jpg',
          title: '눈에 보이는 것들',
          text:
              '''그러면 왜 나와 결혼할 생각을 했느냐고 물었다. 근주는 세 가지를 말해 주었다. 말이 통하는 사람, 믿음이 가는 사람, 그리고 항상 내 편이 되어 줄 수 있는 사람이라고 생각했다는 것이었다. 같은 질문에 나는 이렇게 말해 주었다. 무엇보다 나는 근주의 자신감이 좋았다고. 같이 걸어 다닐 때 우리에게 쏟아지는 눈길, 특히 한국 사람들로부터 받는 관심에 대해 근주는 결코 부끄러워하지 않았다. 우리 사이를 사람들에게 밝힌 뒤, 근주는 나와 데이트하는 것을 자랑스럽게 생각했고, 또 그렇게 행동했다. 내가 나의 직업에 대해 걱정할 때, 근주는 자기 혼자 벌어도 둘이 충분히 먹고살 수 있다고 말해 주었다. 그런 자신감을 나는 소중하게 생각했다.
돌아보면 결혼을 꿈꾸고 준비할 때, 위시리스트를 두 개 작성해야 했다. 나의 배우자가 어떤 사람이었으면 하는 리스트도 중요하지만, 더 중요한 것은 내가 배우자에게 어떤 사람이 되었으면 좋겠다는 목록을 작성하고 준비하는 것이었다. 근주는 그녀의 당당함으로 나에게 자신감을 선물해 주었고, 나는 근주에게 평생 한편이 되어 줄 거란 믿음을 주었다''',
        ),
      ]),
  Character(
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
          date: DateTime.utc(2024, 03, 26),
          chImg:
              'https://i.etsystatic.com/49145865/r/il/7f08d4/5676415711/il_794xN.5676415711_1vw5.jpg',
          title: '내일은 언제오나',
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
          date: DateTime.utc(2024, 03, 26),
          chImg:
              'https://i.pinimg.com/originals/8a/cc/44/8acc447ff368e821eac5f6683f7f1b7a.jpg',
          title: '지긋지긋한 거울',
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
          date: DateTime.utc(2024, 03, 26),
          chImg:
              'https://i.pinimg.com/originals/a8/a8/8a/a8a88a599ab3c9d62df0c62d562d3e25.jpg',
          title: '새로운 일을 시작했습니다.',
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
          date: DateTime.utc(2024, 03, 26),
          chImg:
              'https://i.pinimg.com/originals/aa/f3/3d/aaf33d544a0a041ab22af709cea8d9fb.jpg',
          title: '과유불급',
          text: '''어느 날 초나라 장사꾼이 저잣거리에 방패[盾]와 창[矛]을 늘어놓고 팔고 있었다.
˝자, 여기 이 방패를 보십시오. 이 방패는 어찌나 견고한지 제아무리 날카로운 창이라도 막아낼 수 있습니다.˝
이렇게 자랑한 다음 이번에는 창을 집어들고 외쳐댔다.
˝자, 이 창을 보십시오. 이 창은 어찌나 날카로운지 꿰뚫지 못하는 것이 없습니다.˝
그 때, 구경꾼들 속에서 이런 질문이 튀어나왔다.
˝그럼, 그 창으로 그 방패를 찌르면 어떻게 되는 거요?˝
그러자, 장사꾼은 아무 대답도 못하고 서둘러 그 자리를 떠났다''',
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
          date: DateTime.utc(2024, 03, 26),
          chImg:
              'https://i.pinimg.com/564x/ff/b7/43/ffb743e76587571fc6cdff752b29490f.jpg',
          title: '미니멀한 삶',
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
          date: DateTime.utc(2024, 03, 26),
          chImg:
              'https://i.pinimg.com/originals/4b/4f/19/4b4f195e3dd0c057bdb379a15158f500.jpg',
          title: '조금 힘든 날',
          text: '',
        ),
      ]),
  Character(
      charImg: 'assets/images/char/grandmother.jpg',
      name: '우리 아가 왔나',
      filter: Filter.grandma,
      alpha: 255,
      red: 110,
      green: 0,
      blue: 178,
      chapters: [
        Chapter(
          date: DateTime.utc(2024, 03, 26),
          chImg:
              'https://i.pinimg.com/originals/b2/26/2d/b2262d989f6cdbaafe13025fc2cd7d8b.jpg',
          title: '고향으로 가는 길',
          text: '',
        ),
      ]),
];
