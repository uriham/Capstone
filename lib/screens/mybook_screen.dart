import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:palette_generator/palette_generator.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    super.key,
    required this.photo,
    this.onTap,
    required this.width,
    required this.height,
  });

  final String photo;
  final VoidCallback? onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: width,
      height: height,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class TitleHero extends StatelessWidget {
  const TitleHero({
    super.key,
    required this.title,
    this.onTap,
    // required this.width,
    // required this.height,
  });

  final String title;
  final VoidCallback? onTap;
  // final double width;
  // final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        //width: width,
        //height: height,
        child: Hero(
      tag: title,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){},
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ));
  }
}

class Book {
  final String urlImage;
  final String date;
  final String title;

  const Book({
    required this.urlImage,
    required this.date,
    required this.title,
  });
}

class BookCard extends StatefulWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  late PaletteGenerator _paletteGenerator;
  Color _containerColor = Colors.white;
  // late Shader _gradientShader;
  // late Gradient _gradient;

  @override
  void initState() {
    super.initState();
    _generatePalette();
  }

  void _generatePalette() async {
    final imageProvider = AssetImage(widget.book.urlImage);
    _paletteGenerator = await PaletteGenerator.fromImageProvider(imageProvider);
    setState(() {
      _containerColor = _paletteGenerator.dominantColor!.color;
      // _gradientShader = LinearGradient(
      //   colors: [
      //     _paletteGenerator.dominantColor!.color.withOpacity(0.5),
      //     _paletteGenerator.dominantColor!.color.withOpacity(0.8),
      //   ],
      //   begin: Alignment.center,
      //   end: Alignment.topCenter,
      // ).createShader(
      //     Rect.fromLTRB(0, 0, 247, 350)); // Adjust the dimensions accordingly
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        gradient: RadialGradient(
          colors: [
            //Colors.white,
            _containerColor.withOpacity(1.0),
            Color.fromARGB(70, 30, 30, 30),
          ],
        ),
      ),
      //color: _containerColor,
      child: Container(
        margin: const EdgeInsets.fromLTRB(90, 128, 90, 80),
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        //decoration: BoxDecoration(gradient: _containerColor),
        //color: Colors.black,
        child: Column(
          children: [
            Stack(
              children: [
                // Align(
                //   alignment: Alignment.topRight,
                //   child: PopupMenuButton(
                //     icon: const Icon(Icons.more_vert),
                //     itemBuilder: (BuildContext context) => [
                //       const PopupMenuItem(
                //         value: 1,
                //         child: Text('책 표지 재생성'), // Recreate Book Cover
                //       ),
                //       const PopupMenuItem(
                //         value: 2,
                //         child: Text('제목 변경'), // Change Title
                //       )
                //     ],
                //     onSelected: (value) {},
                //   ),
                // ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: PhotoHero(
                    photo: widget.book.urlImage,
                    width: 250.0,
                    height: 356.0,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (context) {
                          return Scaffold(
                            //appBar: AppBar(),
                            body: Container(
                              // Set background to blue to emphasize that it's a new route.
                              color: Color.fromARGB(255, 30, 30, 30),
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.topCenter,
                              child: Stack(
                                children: [
                                  PhotoHero(
                                    photo: widget.book.urlImage,
                                    width: 400.0,
                                    height: 500.0,
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: TitleHero(
                                      title: widget.book.title,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            bottomNavigationBar: BottomAppBar(
                              shape: CircularNotchedRectangle(),
                              color: Color.fromARGB(120, 94, 94, 94),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.menu),
                                    onPressed: () {},
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(Icons.settings),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.book.date,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              widget.book.title,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBookScreen extends StatelessWidget {
  //const MyBookScreen({super.key});

  List<Book> bookList = [
    Book(
      urlImage: 'assets/images/StarryNight.jpg',
      date: '2023.12.13 ~ 2024.01.01',
      title: '우리들은 기적으로 되어있다',
    ),
    Book(
      urlImage: 'assets/images/JjangGu.jpg',
      date: '2024.01.02 ~ 2024.01.08',
      title: '짱구는 못말려',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Book'),
      ),
      body: PageView.builder(
          itemCount: bookList.length,
          itemBuilder: (context, index) {
            final book = bookList[index];
            return BookCard(book: book);
          }),
      bottomNavigationBar: BottomAppBar(
        //height: 70,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.circle),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
