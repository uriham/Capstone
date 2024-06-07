import 'package:capstone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/user.dart';

void main() {
  runApp(const Profile(userName: 'User Name')); // 사용자 이름을 전달
}

class Profile extends ConsumerWidget {
  final String userName;

  const Profile({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userProvider);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Setting0(
              userInfo: userInfo,
            ),
          ],
        ),
      ),
    );
  }
}

class Setting0 extends StatelessWidget {
  const Setting0({super.key, required this.userInfo});

  final User userInfo;

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
            alignment: const Alignment(0.0, -0.3),
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
                    userInfo.name, // 전달받은 사용자 이름 사용
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
          const Positioned(
            left: 25,
            top: 377,
            child: MenuItem(text: 'Service Introduction\n'),
          ),
          const Positioned(
            left: 25,
            top: 418,
            child: MenuItem(text: 'Contact the Developer\n'),
          ),
          const Positioned(
            left: 25,
            top: 459,
            child: MenuItem(text: 'Term of Use\n'),
          ),
          const Positioned(
            left: 25,
            top: 500,
            child: MenuItem(text: 'Privacy Policy\n'),
          ),
          Align(
            alignment: const Alignment(0.0, -0.7),
            child: Container(
              width: 202,
              height: 202,
              decoration: BoxDecoration(
                  color: const Color(0xFF717171),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.white),
                  image: DecorationImage(
                      image:
                          AssetImage(userInfo.imgPath)) // 선택한 이미지가 있을 때만 이미지 표시
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 72,
      height: 28,
      child: Text(
        'Setting',
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

class MenuItem extends StatelessWidget {
  final String text;

  const MenuItem({super.key, required this.text});

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
