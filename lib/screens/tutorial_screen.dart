import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone/screens/start_screen.dart';
import 'package:capstone/screens/myprofile_screen.dart';
import 'package:capstone/screens/tab.dart';
import 'package:flutter_svg/svg.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController = PageController();
  late TextEditingController _nameController;
  final String _userName = '';
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      // 페이지 인덱스 수정
      _pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      // Navigate to the next screen after the last tutorial page
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return MyProfile(
          userName: _userName,
        ); // MyProfileScreen으로 전환
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildTutorialPage('assets/images/startpage01.png'),
              _buildTutorialPage('assets/images/startpage02.png'),
              _buildTutorialPage('assets/images/startpage03.png'),
              MyProfile(
                userName: _userName,
              ), // MyProfile 클래스를 페이지로 사용합니다.
            ],
          ),
          if (_currentPage != 3) // _currentPage가 3이 아닐 때만 화살표를 보여줌
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: IconButton(
                onPressed: _nextPage,
                icon: const Icon(Icons.arrow_forward),
                color: Colors.white, // 아이콘의 색상 설정
              ),
            ),
          // 페이지 인디케이터
          if (_currentPage != 3)
            Positioned(
              bottom: 16.0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: 4.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index ? Colors.white : Colors.grey,
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTutorialPage(String imagePath) {
    Widget textWidget; // 텍스트 위젯을 저장할 변수

    // 이미지마다 다른 위치에 다른 텍스트를 지정합니다.
    if (imagePath == 'assets/images/startpage01.png') {
      // 첫 번째 이미지에 대한 텍스트
      textWidget = const Positioned(
        bottom: 150.0,
        left: 29.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diarizm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'KoPubWorldDotum_Pro',
                fontWeight: FontWeight.w700,
                height: 0.05,
              ),
            ),
            SizedBox(height: 40), // 텍스트 사이의 간격 조절
            Text(
              '삶을 다채롭게! 일상의 프리즘\n여러분의 마음이 담긴 일기를 다양한 캐릭터들을 통해 여러분의 내면을\n탐색하고 발견하는 여정을 함께 합니다.',
              style: TextStyle(
                color: Color(0xFF8C8C8C),
                fontSize: 13,
                fontFamily: 'KoPubWorldDotum_Pro',
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
            ),
          ],
        ),
      );
    } else if (imagePath == 'assets/images/startpage02.png') {
      // 두 번째 이미지에 대한 텍스트
      textWidget = const Positioned(
        bottom: 150.0,
        left: 29.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('제 3자의 시점\n\n\n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'KoPubWorldDotum_Pro',
                  fontWeight: FontWeight.w700,
                  height: 0.05,
                )),
            SizedBox(height: 40), // 텍스트 사이의 간격 조절
            Text(
              '매력적인 캐릭터들과 이야기 속으로 빠져 여러분들의 일기를 제 3자\n의 시점으로 바라볼 수 있게 도와드립니다',
              style: TextStyle(
                color: Color(0xFF8C8C8C),
                fontSize: 13,
                fontFamily: 'KoPubWorldDotum_Pro',
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
            ),
          ],
        ),
      );
    } else if (imagePath == 'assets/images/startpage03.png') {
      // 세 번째 이미지에 대한 텍스트
      textWidget = const Positioned(
        bottom: 150.0,
        left: 29.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Book cover\n\n\n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'KoPubWorldDotum_Pro',
                  fontWeight: FontWeight.w700,
                  height: 0.05,
                )),
            SizedBox(height: 40), // 텍스트 사이의 간격 조절
            Text('오직 자신만의 책을 소장하여 특별함을 더하다\n캐릭터들과 쌓아온 나만의 일기를 책으로 소장할 수 있어요',
                style: TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontSize: 13,
                  fontFamily: 'KoPubWorldDotum_Pro',
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                )),
          ],
        ),
      );
    } else {
      // 나머지 경우에 대한 기본값
      textWidget = Container(); // 빈 컨테이너를 반환하여 아무것도 표시하지 않음
    }

    // 이미지와 텍스트를 겹쳐서 표시합니다.
    return Stack(
      children: [
        Image.asset(imagePath,
            fit: BoxFit.cover, width: double.infinity, height: double.infinity),
        textWidget, // 텍스트 위젯을 추가합니다.
      ],
    );
  }
}
