import 'package:flutter/material.dart';

void main() {
  runApp(const Profile(userName: 'User Name')); // 사용자 이름을 전달
}

class Profile extends StatefulWidget {
  final String userName;

  const Profile({Key? key, required this.userName}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _selectedImage = ''; // 선택한 이미지 저장 변수

  // 이미지 선택 시 호출될 함수
  void _handleImageSelected(String imagePath) {
    setState(() {
      _selectedImage = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Setting0(
              userName: widget.userName,
              selectedImage: _selectedImage, // 선택한 이미지 전달
              onImageSelected: _handleImageSelected, // 이미지 선택 이벤트 처리 함수 전달
            ),
          ],
        ),
      ),
    );
  }
}

class Setting0 extends StatelessWidget {
  final String userName;
  final String selectedImage; // 선택한 이미지 변수
  final Function(String) onImageSelected; // 이미지 선택 이벤트 처리 함수

  const Setting0({
    Key? key,
    required this.userName,
    required this.selectedImage,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 800,
      color: const Color(0xFF0E0E0E),
      child: Stack(
        children: [
          // 기존 코드...

          Align(
            alignment: Alignment(0.0, -0.7),
            child: GestureDetector(
              onTap: () {
                // 이미지 선택 이벤트 호출
                onImageSelected('assets/images/Myao-maa_profile.png');
              },
              child: Container(
                width: 202,
                height: 202,
                decoration: BoxDecoration(
                  color: const Color(0xFF717171),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.white),
                  image: selectedImage.isNotEmpty
                      ? DecorationImage(
                          image: AssetImage(selectedImage),
                          fit: BoxFit.cover,
                        )
                      : null, // 선택한 이미지가 있을 때만 이미지 표시
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.3),
            child: Container(
              width: 328,
              height: 96,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    userName, // 전달받은 사용자 이름 사용
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'KoPubWorldDotum_Pro',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 377,
            child: MenuItem(text: 'Service Introduction\n'),
          ),
          Positioned(
            left: 25,
            top: 418,
            child: MenuItem(text: 'Contact the Developer\n'),
          ),
          Positioned(
            left: 25,
            top: 459,
            child: MenuItem(text: 'Term of Use\n'),
          ),
          Positioned(
            left: 25,
            top: 500,
            child: MenuItem(text: 'Privacy Policy\n'),
          ),
        ],
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 28,
      child: Text(
        'Setting',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'KoPubWorldDotum_Pro',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;

  const MenuItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 199,
      height: 20,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'KoPubWorldDotum_Pro',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
