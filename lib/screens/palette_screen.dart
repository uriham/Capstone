import 'package:flutter/material.dart';
import 'package:capstone/screens/palette_screen_next.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaletteScreen(),
    );
  }
}

class PaletteScreen extends StatelessWidget {
  const PaletteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Stack으로 Group39569를 글상자 아래에 배치
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 50),
                  child: Row(
                    children: [
                      Text(
                        'PRISM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'KoPubWorldDotum_Pro',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '다른 시선으로\n나를 발견해보세요',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        SizedBox(height: 60),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => palette_screen_next(),
                              ),
                            );
                          },
                          child: Container(
                            width: 360,
                            height: 600,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                  child: Image.asset(
                                    'assets/images/miaomao.png',
                                    width: 300,
                                    height: 350,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Container(
                                    child: Text(
                                      '고양이',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'KoPubWorldDotum_Pro',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  // 두 번째 텍스트 상자
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Container(
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
                                  // 네 번째 텍스트 상자
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  child: Container(
                                    // 배경색 검은색
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Group39569를 글상자 아래에 겹치게 배치
          Positioned(
            top: 800, // 적절한 위치에 겹치도록
            left: 0,
            right: 0,
            child: Group39569(), // Group39569 배치
          ),
        ],
      ),
    );
  }
}

class Group39569 extends StatelessWidget {
  const Group39569({superkey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      child: Stack(
        children: [
          // 다섯 개의 컬러 블록
          Positioned(
            left: 0,
            top: 18,
            child: Container(
              width: 105,
              height: 142,
              decoration: ShapeDecoration(
                color: Color(0xFFF4298B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11), // 둥근 모서리
                ),
              ),
            ),
          ),
          Positioned(
            left: 85,
            top: 0,
            child: Container(
              width: 105,
              height: 142,
              decoration: ShapeDecoration(
                color: Color(0xFF4069CD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11), // 둥근 모서리
                ),
              ),
            ),
          ),
          Positioned(
            left: 170,
            top: 18,
            child: Container(
              width: 105,
              height: 142,
              decoration: ShapeDecoration(
                color: Color(0xFF3CB8D5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11), // 둥근 모서리
                ),
              ),
            ),
          ),
          Positioned(
            left: 255,
            top: 18,
            child: Container(
              width: 105,
              height: 142,
              decoration: ShapeDecoration(
                color: Color(0xFF0CF5AE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11), // 둥근 모서리
                ),
              ),
            ),
          ),
          Positioned(
            left: 340,
            top: 18,
            child: Container(
              width: 105,
              height: 142,
              decoration: ShapeDecoration(
                color: Color(0xFFC6F50C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11), // 둥근 모서리
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
