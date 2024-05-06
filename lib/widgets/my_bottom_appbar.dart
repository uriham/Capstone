import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone/screens/mybook_screen.dart';
import 'package:capstone/screens/palette_screen.dart';

class MyBottomAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
        height: 70,
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return const MybookScreen();
                }));
              },
              child: SvgPicture.asset(
                'assets/images/D_Mybook_ic.svg',
                height: 70,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return const PaletteScreen();
                }));
              },
              child: SvgPicture.asset(
                'assets/images/D_PRISM_ic.svg',
                width: 20,
                height: 70,
              ),
            ),
          ],
        ),
      );
    
  }
}
