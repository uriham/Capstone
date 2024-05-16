import 'package:prism_test/screens/mybook_read.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:prism_test/models/photo_hero.dart';
import 'package:prism_test/screens/mybook_screen.dart';
import 'package:prism_test/models/book.dart';
import 'package:flutter/scheduler.dart';

// Book 클래스
class BookCard extends StatefulWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  late PaletteGenerator _paletteGenerator;
  Color _containerColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _generatePalette();
  }

  // book 이미지 색상 인식
  Future<void> _generatePalette() async {
    final imageProvider = AssetImage(widget.book.url);
    _paletteGenerator = await PaletteGenerator.fromImageProvider(imageProvider);
    setState(() {
      _containerColor = _paletteGenerator.dominantColor!.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 60, 0, 80),
      padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
      // width: 323,
      // height: 458,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
        gradient: RadialGradient(
          colors: [Colors.transparent, _containerColor],
          center: Alignment.center,
          stops: [0.2, 1.0],
          radius: 0.1,
          focalRadius: 1.0,
          focal: Alignment(0.0, 0.0),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: PhotoHero(
                    //width: 268,
                    photo: widget.book.url,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(builder: (context) {
                          return BookReaderPage(book: widget.book);
                        }),
                      );
                    }),
              ),
              const SizedBox(height: 10),
              Text(
                widget.book.date.toString(),
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
              const SizedBox(height: 15),
              Text(
                widget.book.title,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
