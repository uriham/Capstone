import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone/screens/character_cover.dart';
import 'package:capstone/screens/palette_screen.dart';

class MyBottomAppBar extends StatelessWidget{
  const MyBottomAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
      color: Colors.transparent,
        height: 70,
        elevation: 0,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
                  return const CharCoverScreen();
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
                height: 70,
              ),
            ),
          
        ],
      ),
    );
  }
}
