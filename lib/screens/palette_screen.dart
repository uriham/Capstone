import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaletteScreen extends StatelessWidget {
  const PaletteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 첫 번째 불투명한 글상자 (이미지 포함)
          Center(
            child: Container(
              width: 350,
              height: 550,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7), // 반투명한 배경색
                borderRadius: BorderRadius.circular(15), // 모서리 둥글게
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15)), // 상단 모서리 둥글게
                    child: SvgPicture.asset(
                      'assets/images/Myao-maa_profile.svg', // 글상자 안의 이미지
                      width: 350,
                      fit: BoxFit.cover, // 글상자를 채우도록
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 두 번째 글상자 (상단에 그라데이션, 연한 검정색 배경)
          Positioned(
            top: 350, // 수직 위치
            left: 0,
            right: 0, // 수평 중앙 정렬
            child: Center(
              child: Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), // 모서리 둥글게
                  gradient: LinearGradient(
                    begin: Alignment.topCenter, // 그라데이션 시작점
                    end: Alignment(0.0, 0.1), // 10분의 1 지점에서 끝
                    colors: [
                      Colors.black.withOpacity(0.7), // 상단에서 시작
                      Colors.transparent, // 10분의 1 지점에서 투명
                    ],
                    stops: const [0.0, 1.0], // 그라데이션 분포
                  ),
                  color: Colors.black.withOpacity(0.3), // 그라데이션 이후 연한 검정색
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 수직 중앙 정렬
                  children: [
                    const Text(
                      "먀오마아의 은밀한 취미생활", // 텍스트 수정
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        // 텍스트 중앙 정렬
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 화면 상단 중앙에 텍스트 배치
          Positioned(
            top: 40,
            left: 0,
            right: 0, // 수평 중앙 정렬
            child: Center(
              child: Text(
                "다른 시선으로\n새로운 나를 발견해보세요!",
                textAlign: TextAlign.center, // 텍스트 중앙 정렬
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Group39569()를 화면 하단에 배치
          Positioned(
            bottom: -60,
            left: 0,
            right: 0, // 수평 중앙 정렬
            child: const Group39569(),
          ),
        ],
      ),
    );
  }
}

// 컬러 블록을 위한 사용자 정의 위젯
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
