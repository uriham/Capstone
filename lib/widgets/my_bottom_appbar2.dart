import 'dart:ui';
import 'package:capstone/screens/character_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:capstone/screens/palette_screen.dart';
import 'package:capstone/providers/filter_provider.dart';

class MyBottomAppBar2 extends StatelessWidget {
  const MyBottomAppBar2(
      {super.key, required this.clikcGenerate, required this.currentFilter});

  final void Function() clikcGenerate;
  final Filter currentFilter;
  @override
  Widget build(BuildContext context) {
    return Stack(
      //fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRect(
            // <-- clips to the 200x200 [Container] below
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3.0,
                sigmaY: 3.0,
              ),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 90.0,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 26,
          child: SvgPicture.asset(
            'assets/images/D_bar.svg',
            width: 230,
          ),
        ),
        Positioned(
          bottom: 26,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (ctx) {
                      return const CharCoverScreen();
                    }));
                    // 버튼 눌렀을 때
                  },
                  child: const SizedBox(
                    width: 10,
                  )),

              const SizedBox(width: 80), // The gap where the FAB will be placed

              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return const PaletteScreen();
                    }));
                  },
                  child: const SizedBox(
                    height: 20,
                  )),
            ],
          ),
        ),
        Positioned(
            bottom: 17,
            child: TextButton(
              onPressed: clikcGenerate,
              child: SvgPicture.asset(
                'assets/images/D_generate_button.svg',
                color: currentFilter.color,
                width: 87,
              ),
            )),
      ],
    );
  }
}
