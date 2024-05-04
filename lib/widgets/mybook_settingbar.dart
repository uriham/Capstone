import 'package:flutter/material.dart';

class BookSettingBar extends StatefulWidget implements PreferredSizeWidget {
  const BookSettingBar({super.key});
  static bool isVisible = true; // 앱 바의 현재 가시성 상태를 나타냅니다.

  static void toggleVisibility() {
    isVisible = !isVisible;
  }

  @override
  _BookBarState createState() => _BookBarState();

  @override
  Size get preferredSize => Size(345, 47);
}

class _BookBarState extends State<BookSettingBar> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      // width: 345,
      // height: 65,
      visible: BookSettingBar.isVisible,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              //width: 100, // Width of the container
              //height: 50, // Height of the container
              decoration: ShapeDecoration(
                color: Color(0xFF5D5D5D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
