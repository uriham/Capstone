import 'package:capstone/providers/filter_provider.dart';
import 'package:capstone/widgets/diary_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/screens/read_diary_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiaryCard extends ConsumerWidget {
  const DiaryCard(
      {super.key,
      required this.todayDiary,
      required this.index,
      required this.isGenerating});

  final Diary todayDiary;
  final int index;
  final bool isGenerating;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(filterProvider);
    return Container(
      width: double.infinity,
      height: 125,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.10000000149011612),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF414141)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Stack(children: [
        DiaryListTile(
            todayDiary: todayDiary, isGenerating: isGenerating, index: index),
        Positioned(
            top: -15,
            right: 0,
            child: todayDiary.isUsed
                ? SvgPicture.asset(
                    'assets/images/R_Bookmark1_ic.svg',
                    color: currentFilter.color,
                    height: 50,
                  )
                : const SizedBox())
      ]),
    );
  }
}
