import 'package:flutter/material.dart';

class palette_screen_next_miao extends StatelessWidget {
  const palette_screen_next_miao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black, // 전체 배경색을 검은색으로 설정
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 상단 360x318 크기의 이미지
            SizedBox(
              height: 318,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/miaomao.png'), // 상단 이미지
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // 나머지 부분을 검은색 배경으로 설정
            Expanded(
              child: Column(
                // 텍스트 상자 4개를 Column으로 배치
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    // 첫 번째 텍스트 상자
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black, // 배경색 검은색
                        child: Text(
                          '고양이',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    // 두 번째 텍스트 상자
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black,
                        child: Text(
                          '먀오마아의 은밀한 취미생활',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    // 세 번째 텍스트 상자
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black,
                        child: Text(
                          '#고양이 #퉁명 #츤데레 #내편',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    // 네 번째 텍스트 상자
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Container(
                      color: Colors.black, // 배경색 검은색
                      child: Text(
                        '"먀오마아"는 주인의 일기를 훔쳐보는 고양이이다. 먀오마아는 퉁명스럽고 귀찮음이 많지만 주인이 잠든 새벽에 주인의 일기를 보며 주인을 관찰하는 것이 취미이다. 본능에 충실한 고양이로서, 인간들의 심리, 생각, 고정관념에 대해서 이해와 공감을 하지 못하지만 주인을 향한 애정은 확실하다.\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'KoPubWorldDotum_Pro',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black,
                        child: Text(
                          '관계',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Myao-maa_profile.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '먀오마아', // 이미지 아래 텍스트 추가
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // 이미지 간의 간격 줄이기
                        SizedBox(width: 5),
                        // 두 번째 이미지
                        Container(
                          width: 60,
                          height: 7,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Pi_Relationship_ig.png'),
                              fit: BoxFit.contain, // 이미지가 잘리지 않도록
                            ),
                          ),
                        ),
                        SizedBox(width: 5), // 이미지 간의 간격 최소화
                        // 세 번째 이미지

                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/R_Location_circle.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '주인', // 이미지 아래 텍스트 추가
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black,
                        child: Text(
                          '예시',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Container(
                      width: 340,
                      height: 187,
                      color: Color(0xFF1A1A1A),
                      child: Padding(
                        padding: const EdgeInsets.all(10), // 내부 패딩
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '"오후에는 도서관에서 공부를 했는데 취업 때문에 집중이 잘 되지 않았다. 나는 정말 이 길을 갈 수 있을까? 요즘 생각이 깊어진다.."\n\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'KoPubWorldBatang_Pro',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '"주인이 도서관에서 공부를? 집에선 뒹굴뒹굴거리기에 밖에서 제대로 생활하나 했더니 나쁘지 않은 모양이군" 고양이는 속으로 중얼거렸다. "흐음. 어제도 일기에 취업 걱정을 주저리 써놨던데 취업인가 하는 놈이 속을 썩이나보군. 어떻게 생긴 놈인지 알면 앞발펀치를 날려줄텐데. 재수좋은 놈이로군! 그나저나 요새 밥도 잘 안 먹고, 무기력한거 보면 심히 걱정이란 말이지.."\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'KoPubWorldDotum_Pro',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class palette_screen_next_mmung extends StatelessWidget {
  const palette_screen_next_mmung({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black, // 전체 배경색을 검은색으로 설정
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 상단 360x318 크기의 이미지
            SizedBox(
              height: 318,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/kimmung_2.png'), // 상단 이미지
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // 나머지 부분을 검은색 배경으로 설정
            Expanded(
              child: Column(
                // 텍스트 상자 4개를 Column으로 배치
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    // 첫 번째 텍스트 상자
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black, // 배경색 검은색
                        child: Text(
                          '대학생',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    // 두 번째 텍스트 상자
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black,
                        child: Text(
                          '우리도 모르는 우리들의 별빛',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    // 세 번째 텍스트 상자
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black,
                        child: Text(
                          '#대학생 #심리 #배움 #깨달음',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    // 네 번째 텍스트 상자
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Container(
                      color: Colors.black, // 배경색 검은색
                      child: Text(
                        ' 김뭉은 평범한 대학생이다. 사람은 저마다의 빛을 가지고 있다. 다만 모든 이들이 깨닫지 못한다. 김뭉은 한 사람의 인생 스토리가 닮긴 소설책을 읽으며, 주인공의 빛을 발견한다. 사람들의 심리를 이해하고 관찰하며 자신 또한 그들로 인해 깨달음을 얻고자한다.\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'KoPubWorldDotum_Pro',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black,
                        child: Text(
                          '관계',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Kimmung_profile.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '김뭉', // 이미지 아래 텍스트 추가
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // 이미지 간의 간격 줄이기
                        SizedBox(width: 5),
                        // 두 번째 이미지
                        Container(
                          width: 60,
                          height: 7,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Pi_Relationship_ig.png'),
                              fit: BoxFit.contain, // 이미지가 잘리지 않도록
                            ),
                          ),
                        ),
                        SizedBox(width: 5), // 이미지 간의 간격 최소화
                        // 세 번째 이미지

                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/R_Location_circle.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '소설 속 주인공', // 이미지 아래 텍스트 추가
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Container(
                      width: 340,
                      height: 187,
                      color: Color(0xFF1A1A1A),
                      child: Padding(
                        padding: const EdgeInsets.all(10), // 내부 패딩
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '"초봄이라 날씨가 쌀쌀했다. 한숨을 쉬니 하얗게 올라오는 입김들을 보니 조금은 머리가 차분해 지는 기분이었다."\n\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'KoPubWorldBatang_Pro',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '늘 이맘때 쯤이면 소설 한 권을 들고 조용한 공원을 찾곤 한다. 그곳에서 다른 사람들의 이야기를 읽으며, 그들의 생각과 감정을 이해하려 노력한다. 이것이 내가 문학을 통해 세상을 바라보는 방식이다. 각자의 삶에서 빛나는 순간들을 발견하는 것, 그것이 내가 문학에 빠진 이유다.이 짧은 문장에서도, 저자는 계절의 변화와 인간의 내적 감정을 섬세하게 포착하고 있다....',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'KoPubWorldDotum_Pro',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class palette_screen_next_yang extends StatelessWidget {
  const palette_screen_next_yang({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black, // 전체 배경색을 검은색으로 설정
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 상단 360x318 크기의 이미지
            SizedBox(
              height: 318,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Yangkee_2.png'), // 상단 이미지
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // 나머지 부분을 검은색 배경으로 설정
            Expanded(
              child: Column(
                // 텍스트 상자 4개를 Column으로 배치
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    // 첫 번째 텍스트 상자
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black, // 배경색 검은색
                        child: Text(
                          '양아치',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    // 두 번째 텍스트 상자
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black,
                        child: Text(
                          '귀여운 것은 곧 사랑이다',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    // 세 번째 텍스트 상자
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black,
                        child: Text(
                          '#대학생 #심리 #배움 #깨달음',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    // 네 번째 텍스트 상자
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Container(
                      color: Colors.black, // 배경색 검은색
                      child: Text(
                        '손뜨개를 좋아하는 양키. 아무도 자신이 손뜨개질을 좋아하는 지 모른다. 같이 손뜨개질을 하는 친구 빼고. 입이 험하고 행동이 거칠지만 귀여운 것을 좋아하는 순수한 소년이다. 친구에게 거칠게 입막음을 하지만 친구의 이야기를 잘 들어주며 그의 단순한 생각회로로 도움을 줄 때도 있다 \n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'KoPubWorldDotum_Pro',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black,
                        child: Text(
                          '관계',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/yangkee_profile.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '양키', // 이미지 아래 텍스트 추가
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // 이미지 간의 간격 줄이기
                        SizedBox(width: 5),
                        // 두 번째 이미지
                        Container(
                          width: 60,
                          height: 7,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Pi_Relationship_ig.png'),
                              fit: BoxFit.contain, // 이미지가 잘리지 않도록
                            ),
                          ),
                        ),
                        SizedBox(width: 5), // 이미지 간의 간격 최소화
                        // 세 번째 이미지

                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/R_Location_circle.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '손뜨개질 동아리 친구', // 이미지 아래 텍스트 추가
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        color: Colors.black,
                        child: Text(
                          '예시',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'KoPubWorldDotum_Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Container(
                      width: 340,
                      height: 187,
                      color: Color(0xFF1A1A1A),
                      child: Padding(
                        padding: const EdgeInsets.all(10), // 내부 패딩
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '"오늘 병원에 다녀왔다. 큰 병이 있어 간 것은 아니였고 건강검진 차 다녀온 것이다."\n\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'KoPubWorldBatang_Pro',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '양키 : 야, 너 병원 갔다 왔다며? 왠 병원?\n\n나 : 단순히 건강검진 다녀온 거야.\n\n양키 : 뭐어어? 건강검진??...음 그래 건강은 일찍이 챙겨야지. 근데 너 면상이 왜 이렇게 어둡냐.\n\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'KoPubWorldDotum_Pro',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
