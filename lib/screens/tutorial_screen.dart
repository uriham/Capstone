import 'package:capstone/screens/add_book.dart';
import 'package:capstone/screens/tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone/screens/start_screen.dart';
import 'package:capstone/screens/myprofile_screen.dart'; // MyProfile 클래스를 가져옵니다.

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController = PageController();
  late TextEditingController _nameController;
  String _userName = '';

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
    if (_currentPage < 3) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      // Navigate to the next screen after the last tutorial page
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return TapScreen(userName: _userName); // 사용자 이름을 StartScreen으로 전달
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: ElevatedButton(
                onPressed: _nextPage,
                child: const Icon(Icons.arrow_forward),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTutorialPage(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
