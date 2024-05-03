import 'package:flutter/material.dart';

void main() {
  runApp(const PaletteScreen());
}

class PaletteScreen extends StatelessWidget {
  const PaletteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: TitleMyDiary(), // 좌측 상단에 "PRISM"
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '다른 시선으로\n새로운 나를 발견해보세요!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // 이미지 클릭 시 애니메이션과 함께 페이지 전환
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration:
                            Duration(milliseconds: 500), // 트랜지션 시간
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FullScreenImage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          // 페이드 효과 애니메이션
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/images/miaomao2.png',
                    width: 250,
                    height: 500,
                  ),
                ),
                SizedBox(height: 10),
                Group39569(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    
  }
}

class FullScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 전체 화면을 검은색으로 설정
      body: Center(
        child: Image.asset(
          'assets/images/miaomao1.png', // 전체 화면에 표시할 이미지
          fit: BoxFit.contain, // 이미지가 화면에 맞게 조정되도록
        ),
      ),
    );
  }
}

class Group39569 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Container(
            width: 445,
            height: 165,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 23,
                  child: Container(
                    width: 105,
                    height: 142,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF4298B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
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
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 170,
                  top: 23,
                  child: Container(
                    width: 105,
                    height: 142,
                    decoration: ShapeDecoration(
                      color: Color(0xFF3CB8D5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 23,
                  child: Container(
                    width: 105,
                    height: 142,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0CF5AE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 340,
                  top: 23,
                  child: Container(
                    width: 105,
                    height: 142,
                    decoration: ShapeDecoration(
                      color: Color(0xFFC6F50C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitleMyDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'PRISM',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'KoPubWorldDotum_Pro',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}