import 'package:capstone/main.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/screens/mybook_read.dart';
import 'package:capstone/screens/read_book.dart';
import 'package:capstone/widgets/my_bottom_appbar.dart';
import 'package:capstone/widgets/mybook_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';
//import 'package:capstone/providers/book_provider.dart';
import 'package:capstone/widgets/photo_hero.dart';
import 'package:capstone/models/book.dart';
import 'package:flutter/scheduler.dart';

// PhotoHero 클래스 (book 클릭하면 사진 확대되며 화면 차지)
class PhotoHero extends StatelessWidget {
  const PhotoHero({
    super.key,
    required this.photo,
    this.onTap,
    //required this.width,
  });

  final String photo;
  final VoidCallback? onTap;
  //final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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

// TitleHero 클래스 (book 누르면 타이틀 밑으로 이동)
class TitleHero extends StatelessWidget {
  const TitleHero({
    super.key,
    required this.title,
    this.onTap,
    // required this.width,
    // required this.height,
    required this.size,
  });

  final String title;
  final VoidCallback? onTap;
  // final double width;
  // final double height;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: size,
            ),
          ),
        ),
      ),
    );
  }
}

// Book 클래스
class BookCard extends ConsumerStatefulWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  ConsumerState<BookCard> createState() => _BookCardState();
}

class _BookCardState extends ConsumerState<BookCard> {
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
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        gradient: RadialGradient(
          colors: [
            //Colors.white,
            _containerColor.withOpacity(1.0),
            Color.fromARGB(70, 30, 30, 30),
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(90, 128, 90, 80),
        child: Column(
          children: [
            Container(
              width: 288,
              height: 383,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
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
            ),
            const SizedBox(height: 10),
            Text(
              widget.book.date.toString(),
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              widget.book.title,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

// MybookScreen 클래스
class MybookScreen extends StatelessWidget {
  const MybookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final bookList = ref.watch(bookProvider);
    List<Book> bookList = [
      Book(
          url: 'assets/images/StarryNight.jpg',
          date: DateTime.timestamp(),
          title: '반 고흐의 감성',
          text: '...'),
      Book(
          url: 'assets/images/example.png',
          date: DateTime.timestamp(),
          title: '우리들은 기적으로 되어있다',
          text: '''오늘은 맑은 가을 날씨였다. 
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. 
          나는 조금 더 잠을 자고 싶었지만, 새소리가 너무 시끄러워서 일어나기로 했다.
          침대에서 나와 커튼을 열고 창문을 열었다. 시원한 가을 바람이 내 얼굴을 스쳤다.
          나는 깊에 한숨을 들이쉬며 오늘 하루를 시작할 준비를 했다. \n\n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n\n\n\n\n\n
          
          아침 식사를 하고 난 후, 나는 학교에 가기 위해 집을 나섰다.
          학교까지 가는 길은 단풍잎으로 가득..'''),
    ];

    if (bookList.isEmpty) {
      return const Center(
        child: Text(
          'Oh, there is no book here',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    //final book = bookList[0];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "My Book",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'KoPubWorldDotum_Pro',
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: PageView.builder(
          itemCount: bookList.length,
          itemBuilder: (context, index) {
            final book = bookList[index];
            return BookCard(book: book);
          }),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
