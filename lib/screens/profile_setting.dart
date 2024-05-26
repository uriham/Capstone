import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const MyProfile(userName: 'DefaultUsername'),
    );
  }
}

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key, required this.userName}) : super(key: key);

  final String userName;

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late TextEditingController _controller;
  String _userName = '';
  String? _selectedImage;

  @override
  void initState() {
    super.initState();
    _userName = widget.userName;
    _controller = TextEditingController(text: _userName);
  }

  void _updateUserName(String newName) {
    setState(() {
      _userName = newName;
    });
  }

  void _handleImageSelected(String imagePath) {
    setState(() {
      _selectedImage = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Start01(
            controller: _controller,
            userName: _userName,
            selectedImage: _selectedImage,
            onUserNameUpdated: _updateUserName,
            onImageSelected: _handleImageSelected,
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
      color: const Color(0xFF0E0E0E),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.all(10),
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
            const SizedBox(height: 150),
            Center(
              child: Container(
                width: 165,
                height: 165,
                decoration: BoxDecoration(
                  color: const Color(0xFF717171),
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
            const SizedBox(height: 10),
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
                    margin: const EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Myao-maa_profile.png'),
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
                    margin: const EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Kimmung_profile.png'),
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
                    margin: const EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/yangkee_profile.png'),
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
                    margin: const EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Myao-maa_profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/Pi_back_ic.png'),
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
                    padding: EdgeInsets.only(left: 60),
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
                  const SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 318,
                          height: 53,
                          child: Stack(
                            children: [
                              Center(
                                child: TextField(
                                  controller: controller,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.72,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    filled: true,
                                    fillColor: const Color.fromRGBO(
                                        217, 217, 217, 1.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    hintText: '텍스트를 입력하세요',
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 45,
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
                        const SizedBox(height: 180),
                        Container(
                          width: 330,
                          height: 46,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(
                                    userName: controller.text,
                                    selectedImage: selectedImage,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 328.15,
                                  height: 45.74,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: const Color.fromRGBO(
                                          217, 217, 217, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(13),
                                    color: const Color(0xFFD9D9D9),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '다음',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.8,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  final String userName;
  final String? selectedImage;

  const Profile({Key? key, required this.userName, this.selectedImage})
      : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _selectedImage = '';

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.selectedImage ?? ''; // 초기 선택된 이미지 설정
  }

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
              selectedImage: _selectedImage,
              onImageSelected: _handleImageSelected,
            ),
          ],
        ),
      ),
    );
  }
}

class Setting0 extends StatelessWidget {
  final String userName;
  final String selectedImage;
  final Function(String) onImageSelected;

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
          Align(
            alignment: Alignment(0.0, -0.7),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageSelectionScreen(
                      onImageSelected: onImageSelected,
                    ),
                  ),
                );
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
                      : null,
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
                    userName,
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

class ImageSelectionScreen extends StatelessWidget {
  final Function(String) onImageSelected;

  const ImageSelectionScreen({Key? key, required this.onImageSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Image'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: [
          GestureDetector(
            onTap: () {
              onImageSelected('assets/images/Myao-maa_profile.png');
              Navigator.pop(context);
            },
            child: Image.asset('assets/images/Myao-maa_profile.png'),
          ),
          GestureDetector(
            onTap: () {
              onImageSelected('assets/images/Kimmung_profile.png');
              Navigator.pop(context);
            },
            child: Image.asset('assets/images/Kimmung_profile.png'),
          ),
          GestureDetector(
            onTap: () {
              onImageSelected('assets/images/yangkee_profile.png');
              Navigator.pop(context);
            },
            child: Image.asset('assets/images/yangkee_profile.png'),
          ),
        ],
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
