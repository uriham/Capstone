import 'package:flutter/material.dart';
import 'package:capstone/screens/palette_screen_next.dart';
import 'package:capstone/screens/palette_screen_char.dart';

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
                  padding: const EdgeInsets.only(left: 16, top: 30),
                  child: Row(
                    children: [
                      Text(
                        'PRISM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // 문구를 PRISM 아래로 이동
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 70),
                  child: Text(
                    '다른 시선으로\n나를 발견해보세요!', // 중앙 정렬 및 새 위치
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: PageView(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 30), // 좌우 간격
                        child: CustomCard(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    palette_screen_next_miao(),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 30), // 좌우 간격
                        child: CustomCard2(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    palette_screen_next_mmung(),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 30), // 좌우 간격
                        child: CustomCard3(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    palette_screen_next_yang(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 800,
            left: 0,
            right: 0,
            child: Group39569(),
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
