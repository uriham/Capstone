import 'package:capstone/providers/user_provider.dart';
import 'package:capstone/screens/tab.dart';
import 'package:flutter/material.dart';
import 'package:capstone/screens/start_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:capstone/models/user.dart';

class MyProfile extends ConsumerStatefulWidget {
  const MyProfile({Key? key, required this.userName}) : super(key: key);

  final String userName;

  @override
  ConsumerState<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends ConsumerState<MyProfile> {
  late TextEditingController _controller;
  String _userName = ''; // 사용자 이름을 저장할 변수 추가
  String _selectedImage = 'assets/images/circle.png'; // 추가: 선택된 이미지를 저장할 변수

  @override
  void initState() {
    super.initState();
    // 위젯이 초기화될 때 기존 userName을 가져와서 _userName에 저장합니다.
    _userName = widget.userName;
    _controller = TextEditingController(text: '');
  }

  // 사용자 이름을 업데이트하고 _userName을 변경합니다.
  void _updateUserName(String newName) {
    setState(() {
      _userName = newName;
    });
  }

  // 이미지를 선택하면 호출되는 함수
  void _handleImageSelected(String imagePath) {
    setState(() {
      _selectedImage = imagePath;
    });
  }

  void _setUserInfo(String name, String path) {
    ref.read(userProvider.notifier).setUser(User(name: name, imgPath: path));
  }

  // build 함수에서 _userName을 사용하여 표시합니다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Start01(
              controller: _controller,
              userName: _userName,
              selectedImage: _selectedImage, // 변경된 부분: 선택된 이미지를 전달합니다.
              onUserNameUpdated: _updateUserName,
              onImageSelected: _handleImageSelected,
              onStartSelected: _setUserInfo, // 추가: 이미지 선택 이벤트를 처리하는 함수 전달
            ),
          ),
        ),
      ),
    );
  }
}

class Start01 extends StatelessWidget {
  const Start01({
    Key? key,
    required this.onStartSelected,
    required this.controller,
    required this.userName,
    required this.onUserNameUpdated,
    required this.selectedImage,
    required this.onImageSelected,
  }) : super(key: key);

  final TextEditingController controller;
  final String userName;
  final Function(String) onUserNameUpdated;
  final String selectedImage;
  final Function(String) onImageSelected;
  final void Function(String, String) onStartSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFF0E0E0E),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Profile Setting',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'KoPubWorldDotum_Pro',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.64,
                ),
              ),
            ),
            const SizedBox(height: 120),
            Center(
              child: SizedBox(
                width: 220, // 더 큰 컨테이너 크기 설정
                height: 220, // 더 큰 컨테이너 크기 설정
                child: Center(
                  // 원을 중앙에 배치하기 위해 Center 위젯 사용
                  child: Container(
                    width: 165, // 원의 크기를 유지
                    height: 165, // 원의 크기를 유지
                    decoration: BoxDecoration(
                      color: const Color(0xFF717171),
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.white),
                    ),
                    child: selectedImage != null
                        ? ClipOval(
                            // 이미지가 원형 컨테이너에 맞게 자르기 위해 ClipOval 사용
                            child: Image.asset(
                              selectedImage,
                              width: 165, // 원의 크기와 맞춤
                              height: 165, // 원의 크기와 맞춤
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // 추가된 SizedBox
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    onImageSelected('assets/images/circle.png');
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/circle.png', // 수정된 이미지 경로
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onImageSelected('assets/images/triangle.png');
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        alignment: Alignment(0, -0.5), // 이미지 위치 조정
                        image: AssetImage(
                          'assets/images/triangle.png', // 수정된 이미지 경로
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onImageSelected('assets/images/star.png');
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/star.png', // 수정된 이미지 경로
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onImageSelected('assets/images/square.png');
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/square.png', // 수정된 이미지 경로
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 38,
                  height: 38,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: Svg('assets/images/R_Editmode_ic.svg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      '이름',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.52,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 360,
                          height: 53,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 360,
                                  height: 37,
                                  padding: const EdgeInsets.only(
                                      bottom: 0.21, left: 8.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0x19D9D9D9),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                  child: Center(
                                    child: TextField(
                                      controller: controller,
                                      onChanged: onUserNameUpdated,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 0.44,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '텍스트를 입력하세요',
                                        hintStyle: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontSize: 11,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 0.44,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 320,
                                top: 43,
                                child: Text(
                                  '10자 이내',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 8,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0.32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 180),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 330,
                      height: 46,
                      child: GestureDetector(
                        onTap: () {
                          onStartSelected(userName, selectedImage);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TabScreen(
                                selectedImage: selectedImage,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 328.15,
                                  height: 45.74,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF0E0E0E),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: ShaderMask(
                                    shaderCallback: (bounds) {
                                      return const LinearGradient(
                                        colors: [
                                          Color(0xFFFF2287), // 핑크색
                                          Color(0xFF800080), // 보라색
                                          Color(0xFF87CEEB), // 하늘색
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(bounds);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Center(
                                  child: Text(
                                    '시작!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white, // 텍스트 색상을 흰색으로 설정
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.72,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
