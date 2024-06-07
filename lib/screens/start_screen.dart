import 'package:capstone/providers/selected_diary_provider.dart';
import 'package:capstone/screens/add_edit_book.dart';
import 'package:flutter/material.dart';
import 'package:capstone/widgets/diary_card.dart';
import 'package:capstone/models/diary.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone/providers/filter_provider.dart';
import 'dart:math';
import 'package:capstone/widgets/blurred_light.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
      {super.key,
      required this.diaryList,
      required this.nowFilter,
      required this.isGenerating,
      required this.userName});

  final List<Diary> diaryList;
  final Filter nowFilter;
  final bool isGenerating;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            child: const GlowingCirclesBlur(),
          ),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60), // 위쪽 여백 추가
                    Text(
                      '안녕하세요 \n$userName님',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'KoPubWorldDotum_Pro',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 150),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return AddEditBookScreen();
                        }));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 125,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFF414141)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final diary = diaryList[index];
                    final sameDate = index > 0 &&
                        diaryList[index - 1].date.day == diary.date.day;
                    return Column(
                      children: [
                        if (!sameDate)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 11),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  diary.day,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 31,
                                    fontFamily: 'KoPubWorldDotum_Pro',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  diary.date.day == DateTime.now().day
                                      ? '오늘의 기록'
                                      : diary.koreanDay,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'KoPubWorldDotum_Pro',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        DiaryCard(
                          todayDiary: diaryList[index],
                          index: index,
                          isGenerating: isGenerating,
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                      ],
                    );
                  },
                  childCount: diaryList.length,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GlowingCirclesBlur extends StatefulWidget {
  const GlowingCirclesBlur({super.key});

  @override
  _GlowingCirclesBackgroundState createState() =>
      _GlowingCirclesBackgroundState();
}

class _GlowingCirclesBackgroundState extends State<GlowingCirclesBlur>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Circle>? _circles;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;
      setState(() {
        _circles = List.generate(
            10, (_) => Circle(random: _random, screenSize: screenSize));
      });

      _controller.addListener(() {
        if (_circles != null) {
          setState(() {
            for (var circle in _circles!) {
              circle.updatePosition();
              circle.updateColor();
            }
            _circles!
                .removeWhere((circle) => circle.isOutsideScreen(screenSize));
            if (_circles!.length < 6) {
              _circles!.add(Circle(random: _random, screenSize: screenSize));
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: GlowingCirclesPainter(
          animation: _controller, circles: _circles ?? []),
    );
  }
}


/*
class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.diaryList});

  final List<Diary> diaryList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 60), // 위쪽 여백 추가
          const Text(
            '안녕하세요 \nUser님',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'KoPubWorldDotum_Pro',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const AddBookScreen();
              }));
            },
            child: Container(
              width: double.infinity,
              height: 93,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.10000000149011612),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF414141)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(
                'assets/images/D_PRISM_ic.svg',
                width: 30,
                height: 30,
              ),
              const Text(
                '  오늘의 기록',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return DiaryCard(diaryList: diaryList[index],index: index,);
            },
            itemCount: diaryList.length,
          )),

          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
*/
