import 'package:capstone/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:capstone/screens/palette_screen_next.dart';
import 'package:capstone/screens/palette_screen_char.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaletteScreen extends ConsumerStatefulWidget {
  final String selectedImage; // selectedImage 필드 추가

  const PaletteScreen({
    Key? key,
    required this.selectedImage, // 생성자 매개변수로 selectedImage 추가
  }) : super(key: key);

  @override
  ConsumerState<PaletteScreen> createState() => _PaletteScreenState();
}

class _PaletteScreenState extends ConsumerState<PaletteScreen> {
  late PageController _pageController; // PageController 초기화
  double currentPage = 0.0; // 'double' 타입으로 초기화

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page ?? 0.0; // 'page'는 'double'
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void changeFilter(Filter filter) {
    ref.read(filterProvider.notifier).setFilter(filter);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover, // 화면을 완전히 채우도록 설정
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.05,
                    top: size.height * 0.06,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'PRISM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'KoPubWorldDotum_Pro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 3), // 텍스트와 이미지 사이의 간격
                      Image.asset(
                        'assets/images/D_PRISM_ic.png', // 이미지 파일의 경로
                        width: 24, // 원하는 너비
                        height: 24, // 원하는 높이
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    size.height * 0.07,
                    0,
                    size.height * 0.08,
                  ),
                  child: Text(
                    '다른 시선으로\n새로운 나를 발견해보세요!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.width * 0.065,
                      fontFamily: 'KoPubWorldDotum_Pro',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        child: CustomCard_yang(
                          selectedImage:
                              widget.selectedImage, // selectedImage 필드 전달

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => palette_screen_next_yang(
                                    selectedImage: widget.selectedImage),
                              ),
                            );
                          },
                          onCharacterSelected: () {
                            changeFilter(Filter.yangkee);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        child: CustomCard_myao(
                          selectedImage:
                              widget.selectedImage, // selectedImage 필드 전달
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => palette_screen_next_miao(
                                    selectedImage: widget.selectedImage),
                              ),
                            );
                          },
                          onCharacterSelected: () {
                            changeFilter(Filter.myaomah);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        child: CustomCard_mmung(
                          selectedImage: widget.selectedImage,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => palette_screen_next_mmung(
                                    selectedImage: widget.selectedImage),
                              ),
                            );
                          },
                          onCharacterSelected: () {
                            changeFilter(Filter.kimmunng);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        child: CustomCard_pooh(
                          selectedImage: widget.selectedImage,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => palette_screen_next_pooh(
                                    selectedImage: widget.selectedImage),
                              ),
                            );
                          },
                          onCharacterSelected: () {
                            changeFilter(Filter.yangkee);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        child: CustomCard_Thoreau(
                          selectedImage: widget.selectedImage,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    palette_screen_next_Thoreau(
                                        selectedImage: widget.selectedImage),
                              ),
                            );
                          },
                          onCharacterSelected: () {
                            changeFilter(Filter.yangkee);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        child: CustomCard_leesangv2(
                          selectedImage: widget.selectedImage,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    palette_screen_next_leesangv2(
                                        selectedImage: widget.selectedImage),
                              ),
                            );
                          },
                          onCharacterSelected: () {
                            changeFilter(Filter.yangkee);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        child: CustomCard_alsoubet(
                          selectedImage: widget.selectedImage,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    palette_screen_next_alsoubet(
                                        selectedImage: widget.selectedImage),
                              ),
                            );
                          },
                          onCharacterSelected: () {
                            changeFilter(Filter.yangkee);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        child: CustomCard_dongja(
                          selectedImage: widget.selectedImage,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    palette_screen_next_dongja(
                                        selectedImage: widget.selectedImage),
                              ),
                            );
                          },
                          onCharacterSelected: () {
                            changeFilter(Filter.yangkee);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        child: CustomCard_jang(
                          selectedImage: widget.selectedImage,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => palette_screen_next_jang(
                                    selectedImage: widget.selectedImage),
                              ),
                            );
                          },
                          onCharacterSelected: () {
                            changeFilter(Filter.yangkee);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        child: CustomCard_yeonhwa(
                          selectedImage: widget.selectedImage,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    palette_screen_next_yeonhwa(
                                        selectedImage: widget.selectedImage),
                              ),
                            );
                          },
                          onCharacterSelected: () {
                            changeFilter(Filter.yangkee);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        child: CustomCard_halmae(
                          selectedImage: widget.selectedImage,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    palette_screen_next_halmae(
                                        selectedImage: widget.selectedImage),
                              ),
                            );
                          },
                          onCharacterSelected: () {
                            changeFilter(Filter.yangkee);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.9,
            left: 0,
            right: 0,
            child: Group39569(currentPage: currentPage, size: size),
          ),
        ],
      ),
    );
  }
}

/// 밑의 카드 부분 구현

class Group39569 extends StatelessWidget {
  final double currentPage;
  final Size size;

  const Group39569({
    required this.currentPage,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.3,
      child: Stack(
        children: [
          for (double i = 0; i < 14; i++)
            _animatedColorCard(
              left: _calculateLeft(i),
              top: _calculateTop(i),
              color: _getColorForIndex(i),
            ),
        ],
      ),
    );
  }

  Color _getColorForIndex(double index) {
    switch (index) {
      case 0:
        return Color(0xFFF4298B);
      case 1:
        return Color(0xFF4069CD);
      case 2:
        return Color(0xFF3CB8D5);
      case 3:
        return Color(0xFF0CF5AE);
      case 4:
        return Color(0xFFC6F50C);
      case 5:
        return Color(0xFFFBF6E7);
      case 6:
        return Color(0xFFFFDD4D);
      case 7:
        return Color(0xFFFFAE4F);
      case 8:
        return Color(0xFFFF6678);
      case 9:
        return Color(0xFFE1235C);
      case 10:
        return Color(0xFF9E00FF);
      case 11:
        return Color.fromARGB(255, 85, 164, 164);
      case 12:
        return Color.fromARGB(255, 212, 226, 106);
      case 13:
        return Color.fromARGB(255, 45, 46, 38);

      default:
        return Color(0xFF6023E1);
    }
  }

  Widget _animatedColorCard({
    required double left,
    required double top,
    required Color color,
  }) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      left: left,
      top: top,
      child: Container(
        width: size.width * 0.28,
        height: size.height * 0.15,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width * 0.04),
          ),
        ),
      ),
    );
  }

  double _calculateLeft(double index) {
    double baseLeft = size.width * 0.22 * index;
    if (currentPage >= 1) {
      baseLeft -=
          size.width * 0.22 * (currentPage - 1); // index가 4 이상일 때 왼쪽으로 이동
    }
    return baseLeft;
  }

  double _calculateTop(double index) {
    double diff = (currentPage - index).abs();
    if (diff < 1) {
      return size.height * 0.012 + size.height * 0.033 * diff;
    } else {
      return size.height * 0.045;
    }
  }
}
