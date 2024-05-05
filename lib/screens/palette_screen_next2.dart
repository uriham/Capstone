import 'package:flutter/material.dart';

void main() {
  runApp(const palette_screen_next2());
}

class palette_screen_next2 extends StatelessWidget {
  const palette_screen_next2({super.key});

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
                        // 첫 번째 이미지 (잘리지 않고 온전히 보여야 함)
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Myao-maa_profile.png'),
                                fit: BoxFit.contain, // 이미지가 잘리지 않도록
                              ),
                            ),
                          ),
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
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: 78,
                            height: 78,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/R_Location_circle.png'),
                                fit: BoxFit.contain, // 이미지가 온전히 보이도록
                              ),
                            ),
                          ),
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
