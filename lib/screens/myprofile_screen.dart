import 'package:capstone/screens/tab.dart';
import 'package:flutter/material.dart';
import 'package:capstone/screens/start_screen.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyProfile(userName: 'DefaultUsername'));
}

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key, required this.userName}) : super(key: key);

  final String userName;

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late TextEditingController _controller;
  String _userName = ''; // 사용자 이름을 저장할 변수 추가
  String? _selectedImage; // 추가: 선택된 이미지를 저장할 변수

  @override
  void initState() {
    super.initState();
    // 위젯이 초기화될 때 기존 userName을 가져와서 _userName에 저장합니다.
    _userName = widget.userName;
    _controller = TextEditingController(text: _userName);
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

  // build 함수에서 _userName을 사용하여 표시합니다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
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
              onImageSelected:
                  _handleImageSelected, // 추가: 이미지 선택 이벤트를 처리하는 함수 전달
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
    required this.controller,
    required this.userName,
    required this.onUserNameUpdated,
    required this.selectedImage,
    required this.onImageSelected,
  }) : super(key: key);

  final TextEditingController controller;
  final String userName;
  final Function(String) onUserNameUpdated;
  final String? selectedImage;
  final Function(String) onImageSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xFF0E0E0E),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '프로필 설정',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'KoPubWorldDotum_Pro',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.64,
                ),
              ),
            ),
            SizedBox(height: 150),
            Center(
              child: Container(
                width: 165,
                height: 165,
                decoration: BoxDecoration(
                  color: Color(0xFF717171),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.white),
                ),
                child: selectedImage != null
                    ? Image.asset(
                        selectedImage!,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    onImageSelected('assets/images/Myao-maa_profile.png');
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Myao-maa_profile.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onImageSelected('assets/images/Kimmung_profile.png');
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Kimmung_profile.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onImageSelected('assets/images/yangkee_profile.png');
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/yangkee_profile.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onImageSelected('assets/images/Myao-maa_profile.png');
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Myao-maa_profile.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Pi_back_ic.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
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
                  SizedBox(height: 4),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 318,
                          height: 53,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 318,
                                  height: 37,
                                  padding: const EdgeInsets.only(
                                      bottom: 0.21, left: 8.0),
                                  decoration: BoxDecoration(
                                    color: Color(0x19D9D9D9),
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
                                      style: TextStyle(
                                        color: Colors.black,
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
                                left: 278,
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
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 180),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 330,
                      height: 46,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TabScreen(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 328.15,
                              height: 45.74,
                              decoration: ShapeDecoration(
                                color: Color(0xFF0E0E0E),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 2, color: Color(0xFFFF2287)),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '시작!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.72,
                                  ),
                                ),
                              ),
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
