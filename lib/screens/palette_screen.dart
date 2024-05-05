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
  final double currentPage;

  const Group39569({required this.currentPage, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      child: Stack(
        children: [
          for (double i = 0; i < 6; i++)
            _animatedColorCard(
              left: _calculateLeft(i, currentPage),
              top: _calculateTop(i, currentPage),
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
        return Color.fromARGB(255, 237, 238, 235);
      default:
        return Colors.grey;
    }
  }

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

  double _calculateLeft(double index, double currentPage) {
    double baseLeft = 85 * index;
    return baseLeft;
  }

  double _calculateTop(double index, double currentPage) {
    // 애니메이션 효과를 위한 간격을 계산하여 부드러운 이동을 제공합니다.
    double diff = (currentPage - index).abs();
    if (diff < 1) {
      return 18 + 12 * diff; // 부드럽게 상하 이동
    } else {
      return 30; // 다른 경우
    }
  }
}

class CustomCard extends StatelessWidget {
  final VoidCallback onTap;

  CustomCard({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
