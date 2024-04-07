import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:capstone/main.dart';
import 'package:capstone/widgets/diary_show.dart';
import 'package:capstone/data/diarys.dart';

class MyBookScreen extends StatefulWidget {
  const MyBookScreen({super.key});

  @override
  State<MyBookScreen> createState() {
    return _MyBookScreenState();
  }
}

class _MyBookScreenState extends State<MyBookScreen> {
  final todayDiary = allDiarys[0];
  void _myDiary() {
    setState(() {});
  }

  List<BookItem> bookList = [
    BookItem(
      urlImage: 'assets/images/StarryNight.jpg',
      date: '2023.12.13 ~ 2024.01.01',
      title: '우리들은 기적으로 되어있다',
    ),
    BookItem(
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
      body: Container(
        height: 500,
        child: ScrollSnapList(
          itemBuilder: _buildCard,
          itemCount: bookList.length,
          itemSize: 150,
          onItemFocus: (index) {},
          //dynamicItemSize: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    BookItem book = bookList[index];
    return Container(
      margin: EdgeInsets.only(top: 64),
      width: 323,
      height: 458,
      child: Card(
        elevation: 20,
        child: ClipRRect(
          //borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: PopupMenuButton(
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem(
                          value: 1,
                          child: Text('책 표지 재생성'),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text('제목 변경'),
                        )
                      ],
                      onSelected: (value) {},
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      book.urlImage,
                      fit: BoxFit.cover,
                      width: 247,
                      height: 350,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                book.date,
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                book.title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
