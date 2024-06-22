import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoadingText extends StatefulWidget {
  const LoadingText({Key? key}) : super(key: key);

  @override
  State<LoadingText> createState() => _LoadingTextState();
}

class _LoadingTextState extends State<LoadingText> {
  final Random random = Random();
  late List<String> texts;
  late List<int> indices;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    texts = [
      "김뭉은 매운 떡볶이를 좋아합니다.",
      "김뭉은 혼자서 전시회 가는 것을 좋아합니다.",
      "먀오마아는 고양이이지만 김치찌개를 좋아합니다.",
      "먀오마아는 윤기가 좌르를 흐르는 검정 고양이입니다.",
      "먀오마아는 길바닥 생활을 했지만 당신을 만나 따뜻한 집 안에서 매일 낮잠을 잡니다.",
      "알소베의 성향은 소설 이방인에 나오는 뫼르소와 같습니다.",
      "이고의 성향은 소설 그리스인에 나오는 조르바와 같습니다.",
      "양키는 주로 할머니 옷을 손수 뜹니다. 할머니께서는 무척이나 좋아하시지요.",
      "양키는 키링, 인형, 만화 캐릭터 등 작고 귀여운 것을 좋아합니다.",
      "양키는 주로 영화를 보면서 뜨개질을 하지만 가끔씩은 드라마를 보기도 합니다.",
      "양키의 사랑 표현 방법은 뜨개질 나눔입니다.",
      "연화는 사람들의 속마음을 들을 수 있습니다. 아침엔 가게 문을 열지 않습니다. 사람들의 출근길이 무섭기 때문입니다.",
      "연화의 성은 김씨입니다. 김연화",
      "사실 이레는 손님의 말을 잘 들어주지만 가끔 지나가는 나비에 시선을 빼깁니다.",
      "이레는 수다쟁이입니다. 손님이 가도 돌에게 인사하고 꽃에게 하루 일과를 조잘조잘 얘기합니다.",
      "동생 보아라는 실제 이상이 여동생에게 쓴 편지에서 따온 말입니다. \"동생 옥희 보아라\".",
      "지나가던 이가 장승을 모욕하면 장승은 대방장승에게 고소를 넣어 그 사람에게 질병이 벌로 내려지게합니다.",
      "질병에 걸린 이는 장승에게 막걸리와 북어대를 갖다 바치고 빌고 장승귀를 잡고 입맞춤을 해야 낳을 수 있습니다.",
    ];

    // 순서를 섞은 리스트를 생성합니다.
    indices = List<int>.generate(texts.length, (index) => index)..shuffle();
  }

  String getNextText() {
    // currentIndex를 사용하여 셔플된 순서대로 텍스트를 반환합니다.
    String nextText = texts[indices[currentIndex]];
    currentIndex = (currentIndex + 1) % texts.length; // 다음 인덱스로 이동
    return nextText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 18.0,
          fontFamily: 'KoPubWorldDotum_Pro',
          fontWeight: FontWeight.w700,
          height: 1.2,
          letterSpacing: 0.72,
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                for (int i = 0; i < texts.length; i++)
                  FadeAnimatedText(getNextText(),
                      duration: const Duration(seconds: 5)),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ),
      ),
    );
  }
}
