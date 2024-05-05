import 'package:flutter/material.dart';
import 'package:capstone/screens/palette_screen_next.dart';
import 'package:capstone/screens/palette_screen_char.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaletteScreen(),
    );
  }
}

class PaletteScreen extends StatefulWidget {
  const PaletteScreen({super.key});

  @override
  _PaletteScreenState createState() => _PaletteScreenState();
}

class _PaletteScreenState extends State<PaletteScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 30),
                  child: Row(
                    children: [
                      Text(
                        'PRISM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 70),
                  child: Text(
                    '다른 시선으로\n나를 발견해보세요!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: CustomCard_myao(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    palette_screen_next_miao(),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: CustomCard_mmung(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    palette_screen_next_mmung(),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: CustomCard_yang(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    palette_screen_next_yang(),
                              ),
                            );
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
            top: 800,
            left: 0,
            right: 0,
            child: Group39569(currentPage: currentPage),
          ),
        ],
      ),
    );
  }
}

class Group39569 extends StatelessWidget {
  final double currentPage; // 'double' 타입

  const Group39569({required this.currentPage, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      child: Stack(
        children: [
          _animatedColorCard(
            left: _calculateLeft(0, currentPage),
            top: _calculateTop(0, currentPage),
            color: Color(0xFFF4298B),
          ),
          _animatedColorCard(
            left: _calculateLeft(1, currentPage),
            top: _calculateTop(1, currentPage),
            color: Color(0xFF4069CD),
          ),
          _animatedColorCard(
            left: _calculateLeft(2, currentPage),
            top: _calculateTop(2, currentPage),
            color: Color(0xFF3CB8D5),
          ),
          _animatedColorCard(
            left: _calculateLeft(3, currentPage),
            top: _calculateTop(3, currentPage),
            color: Color(0xFF0CF5AE),
          ),
          _animatedColorCard(
            left: _calculateLeft(4, currentPage),
            top: _calculateTop(4, currentPage),
            color: Color(0xFFC6F50C),
          ),
          _animatedColorCard(
            left: _calculateLeft(4, currentPage),
            top: _calculateTop(4, currentPage),
            color: Color(0xFFC6F50C),
          ),
        ],
      ),
    );
  }

  // 부드러운 애니메이션을 위해 'AnimatedPositioned' 사용
  Widget _animatedColorCard({
    required double left,
    required double top,
    required Color color,
  }) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 200),
      left: left,
      top: top,
      child: Container(
        width: 105,
        height: 142,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
      ),
    );
  }

  // 각 카드의 왼쪽 위치를 'currentPage'에 따라 계산
  double _calculateLeft(double index, double currentPage) {
    double baseLeft = 85 * index; // 각 카드의 기본 위치
    return baseLeft;
  }

  // 각 카드의 위쪽 위치를 'currentPage'에 따라 계산
  double _calculateTop(int index, double currentPage) {
    if (index == currentPage.floor()) {
      return 18; // 현재 페이지인 경우
    } else {
      return 30; // 다른 페이지인 경우
    }
  }
}
