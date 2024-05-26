import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class MyBottomAppBar2 extends StatelessWidget {
  const MyBottomAppBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 110,
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 26,
            child: Container(
              width: 207,
              height: 48,
              margin: EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(221, 241, 6, 6),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        // 버튼 눌렀을 때
                      },
                      child: SvgPicture.asset('assets/images/D_Mybook_ic.svg')),

                  SizedBox(width: 48), // The gap where the FAB will be placed

                  GestureDetector(
                      onTap: () {
                        // 버튼 눌렀을 때
                      },
                      child: SvgPicture.asset('assets/images/D_PRISM_ic.svg')),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 34,
            child: GestureDetector(
                onTap: () {
                  // 버튼 눌렀을 때
                },
                child: SvgPicture.asset('assets/images/D_generate_button.svg')),
          ),
        ],
      ),
    );
  }
}