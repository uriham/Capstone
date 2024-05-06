import 'package:capstone/screens/mybook_screen.dart';
import 'package:capstone/models/book.dart';
import 'package:capstone/widgets/mybook_settingbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookReaderPage extends StatelessWidget {
  final Book book;

  const BookReaderPage({super.key, required this.book});

  static bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 620,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                //title: Text(book.title),
                background: PhotoHero(
                  photo: book.url,
                ),
              ),
              // leading: IconButton(
              //     onPressed: () {
              //       // setState(() {
              //       //   isCheck = !isCheck;
              //       // });
              //     },
              //     icon: isCheck
              //         ? SvgPicture.asset("assets/images/R_Bookmark0_ic.svg")
              //         : SvgPicture.asset("assets/images/R_Bookmark1_ic.svg")),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/R_Bookmark0_ic.svg'),
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      child: ListTile(
                        // leading: SvgPicture.asset(
                        //     'assets/images/E_R_Full screen_ic.svg'),
                        title: Text('전체 화면'),
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                          // leading:
                          //     SvgPicture.asset('assets/images/E_R_PDF_ic.svg'),
                          title: Text('PDF로 내보내기')),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                          // leading:
                          //     SvgPicture.asset('assets/images/E_R_Share_ic.svg'),
                          title: Text('공유하기')),
                    ),
                  ],
                  onSelected: (value) {},
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  TitleHero(
                    title: book.title,
                    size: 18.0,
                  ),
                  SizedBox(height: 300),
                  Center(
                    child: Text(book.date.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(book.text,
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  )
                ],
              ),
            )
          ]),
          Positioned(
            left: 8,
            bottom: 19,
            child: BookSettingBar(),
          )
        ],
      ),
    );
  }
}
