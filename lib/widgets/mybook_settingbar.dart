import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookSettingBar extends StatelessWidget {
  const BookSettingBar(
      {super.key,
      required this.contentBoxVisibility,
      required this.controlBoxVisibility,
      required this.settingBoxVisibility});

  final void Function() contentBoxVisibility;
  final void Function() controlBoxVisibility;
  final void Function() settingBoxVisibility;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: 390, // Width of the container
            height: 50, // Height of the container
            decoration: ShapeDecoration(
              color: const Color(0xFF5D5D5D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: contentBoxVisibility,
                  icon: SvgPicture.asset("assets/images/R_Content_ic.svg"),
                ),
                IconButton(
                  onPressed: controlBoxVisibility,
                  icon: SvgPicture.asset("assets/images/R_Control_ic.svg"),
                ),
                IconButton(
                  onPressed: settingBoxVisibility,
                  icon: SvgPicture.asset("assets/images/R_setting_ic.svg"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
