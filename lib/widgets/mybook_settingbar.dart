import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prism_test/widgets/settingbar_content.dart';

class BookSettingBar extends StatefulWidget {
  const BookSettingBar(
      {super.key,
      required this.contentBoxVisibility,
      required this.controlBoxVisibility,
      required this.settingBoxVisibility});

  static bool isVisible = true;
  final Function contentBoxVisibility;
  final Function controlBoxVisibility;
  final Function settingBoxVisibility;

  // static void toggleVisibility() {
  //   isVisible = !isVisible;
  // }

  @override
  _BookBarState createState() => _BookBarState();
}

class _BookBarState extends State<BookSettingBar> {
  //bool _isContentBarVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: 390, // Width of the container
            height: 50, // Height of the container
            decoration: ShapeDecoration(
              color: Color(0xFF5D5D5D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.contentBoxVisibility();
                    });
                  },
                  icon: SvgPicture.asset('assets/images/R_Content_ic.svg'),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        widget.controlBoxVisibility();
                      });
                    },
                    icon: SvgPicture.asset('assets/images/R_Control_ic.svg')),
                IconButton(
                    onPressed: () {
                      setState(() {
                        widget.settingBoxVisibility();
                      });
                    },
                    icon: SvgPicture.asset('assets/images/R_setting_ic.svg')),
              ],
            ),
          ),
        ),
        //if (_isContentBarVisible)
        // Visibility(
        //   visible: _isContentBarVisible,
        //   child: Positioned(
        //       bottom: 0, // Height of the container
        //       left: 0,
        //       child: Container(
        //         width: 360,
        //         height: 286,
        //         decoration: BoxDecoration(
        //             color: Colors.black,
        //             borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(20.0),
        //               topRight: Radius.circular(20.0),
        //             )),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             Text("글자 크기"),
        //             Text("줄간격"),
        //             Text("설정 초기화"),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: <Widget>[
        //                 TextButton(
        //                   onPressed: () {
        //                     _isContentBarVisible = false;
        //                   },
        //                   child: Text("확인"),
        //                 ),
        //                 TextButton(
        //                   onPressed: () {
        //                     _isContentBarVisible = false;
        //                   },
        //                   child: Text("취소"),
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       )),
        // ),
      ],
    );
  }
}
