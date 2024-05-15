import 'package:flutter/material.dart';
import 'package:capstone/screens/palette_screen_next.dart';
import 'package:capstone/screens/palette_screen_char.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaletteScreen(),
    );
  }
}

class PaletteScreen extends StatefulWidget {
  const PaletteScreen({Key? key}) : super(key: key);

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
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
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
                    top: size.height * 0.04,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'PRISM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.08,
                          fontFamily: 'KoPubWorldDotum_Pro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    size.height * 0.05,
                    0,
                    size.height * 0.1,
                  ),
                  child: Text(
                    '다른 시선으로\n나를 발견해보세요!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.width * 0.065,
                      fontFamily: 'KoPubWorldDotum_Pro',
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
                          horizontal: size.width * 0.14,
                        ),
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
                          onCharacterSelected: () {
                            //방식 결정해서 여기 추가
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.14,
                        ),
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
                          onCharacterSelected: () {
                            //방식 결정해서 여기 추가
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.14,
                        ),
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
                          onCharacterSelected: () {
                            //방식 결정해서 여기 추가
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
      height: size.height * 0.2,
      child: Stack(
        children: [
          for (double i = 0; i < 6; i++)
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
    double baseLeft = size.width * 0.25 * index;
    return baseLeft;
  }

  double _calculateTop(double index) {
    double diff = (currentPage - index).abs();
    if (diff < 1) {
      return size.height * 0.036 + size.height * 0.024 * diff;
    } else {
      return size.height * 0.06;
    }
  }
}
