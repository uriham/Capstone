import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  static bool isVisible = false; // 앱 바의 현재 가시성 상태를 나타냅니다.

  static void toggleVisibility() {
    isVisible = !isVisible;
  }

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  static bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      // Visibility 위젯을 사용하여 앱 바의 가시성을 제어합니다.
      visible: MyAppBar.isVisible, // isVisible 변수에 따라 앱 바를 숨기거나 표시합니다.
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Book Title'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                setState(() {
                  isCheck = !isCheck;
                });
              },
              icon: isCheck
                  ? SvgPicture.asset("assets/images/R_Bookmark0_ic.svg")
                  : SvgPicture.asset("assets/images/R_Bookmark1_ic.svg")),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: ListTile(
                  // leading:
                  //     SvgPicture.asset("assets/images/E_R_Full screen_ic.svg"),
                  title: Text("전체 화면"),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                    // leading: SvgPicture.asset("assets/images/E_R_PDF_ic.svg"),
                    title: Text("PDF로 내보내기")),
              ),
              PopupMenuItem(
                child: ListTile(
                    // leading: SvgPicture.asset("assets/images/E_R_Share_ic.svg"),
                    title: Text("공유하기")),
              ),
            ],
            onSelected: (value) {},
          )
        ],
      ),
    );
  }
}
