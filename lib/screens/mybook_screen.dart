import 'package:capstone/screens/read_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:capstone/providers/book_provider.dart';
import 'package:capstone/widgets/photo_hero.dart';
// PhotoHero 클래스

// MybookScreen 클래스
class MybookScreen extends ConsumerStatefulWidget {
  const MybookScreen({super.key});

  @override
  ConsumerState<MybookScreen> createState() => _MybookScreenState();
}

class _MybookScreenState extends ConsumerState<MybookScreen> {
  late PaletteGenerator _paletteGenerator;
  Color _backgroundColor = Colors.grey; // 기본 배경색
  List<Color> _gradientColors = [Colors.grey, Colors.grey]; // 그라데이션 색상

  @override
  void initState() {
    super.initState();
    //_generatePalette();
  }

  Future<void> _generatePalette() async {
    final bookList = ref.watch(bookProvider);
    if (bookList.isNotEmpty) {
      final imageProvider = NetworkImage(bookList[0].url);
      _paletteGenerator =
          await PaletteGenerator.fromImageProvider(imageProvider);
      final dominantColor =
          _paletteGenerator.dominantColor?.color ?? Colors.grey;
      final lightVibrantColor =
          _paletteGenerator.lightVibrantColor?.color ?? Colors.white;
      setState(() {
        _backgroundColor = dominantColor;
        _gradientColors = [dominantColor, lightVibrantColor]; // 그라데이션 색상
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookList = ref.watch(bookProvider);

    if (bookList.isEmpty) {
      return const Center(
        child: Text(
          'Oh, there is no book here',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    final book = bookList[0];

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center, // 중심점
            radius: 1, // 반경
            colors: _gradientColors, // 그라데이션 색상
          ),
        ),
        alignment: Alignment.center,
        child: PhotoHero(
          photo: book.url,
          width: 300,
          height: 400,
          borderRadius: 20,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) {
                return ReadBookScreen(book: book);
              }),
            );
          },
        ),
      ),
    );
    ;
  }
}

/*Scaffold(
                      appBar: AppBar(),
                      body: Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment.center, // 중심점
                            radius: 1, // 반경
                            colors: _gradientColors, // 그라데이션 색상
                          ),
                        ),
                        alignment: Alignment.center,
                        child: PhotoHero(
                          photo: book.url,
                          width: 300,
                          height: 400,
                          borderRadius: 20,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );*/