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
        // Group39569 배치를 위해 Stack 사용
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
                SizedBox(height: 50),
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '다른 시선으로\n나를 발견해보세요!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        SizedBox(height: 30),
                        CustomCard2(
                          // 새로운 클래스를 사용
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
                      ],
                    ),
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
