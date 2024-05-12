import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prism_test/screens/mybook_screen.dart';
import 'package:prism_test/widgets/mybook_settingbar.dart';
import 'package:prism_test/models/photo_hero.dart';
import 'package:prism_test/models/title_hero.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:prism_test/models/book.dart';
import 'package:scroll_wheel_date_picker/scroll_wheel_date_picker.dart';

class BookReaderPage extends StatefulWidget {
  final Book book;

  const BookReaderPage({super.key, required this.book});

  @override
  _BookReadState createState() => _BookReadState();
}

class _BookReadState extends State<BookReaderPage> {
  static bool isCheck = false;
  bool _isReadSetBarVisible = false;
  bool _isContentBoxVisible = false;
  bool _isControlBoxVisible = false;
  bool _isSettingBoxVisible = false;

  FontStyle _fontStyle = FontStyle.normal;
  double _fontSize = 15.0;
  double _fontHeight = 1.5;
  Color _textColor = Colors.black;

  void _sizeInc() {
    setState(() {
      _fontSize += 1;
    });
  }

  void _sizeDec() {
    setState(() {
      _fontSize -= 1;
    });
  }

  void _heightInc() {
    setState(() {
      _fontHeight += 0.5;
    });
  }

  void _heightDec() {
    setState(() {
      _fontHeight -= 0.5;
    });
  }

  void _readSetBarVisibility() {
    setState(() {
      _isReadSetBarVisible = !_isReadSetBarVisible;
    });
  }

  void _contentBoxVisibility() {
    setState(() {
      _isContentBoxVisible = !_isContentBoxVisible;
    });
  }

  void _controlBoxVisibility() {
    setState(() {
      _isControlBoxVisible = !_isControlBoxVisible;
    });
  }

  void _settingBoxVisibility() {
    setState(() {
      _isSettingBoxVisible = !_isSettingBoxVisible;
    });
  }

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_isContentBoxVisible ||
              _isControlBoxVisible ||
              _isSettingBoxVisible) return;
          _readSetBarVisibility();
        });
      },
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 620,
                elevation: 0,
                flexibleSpace: ShaderMask(
                  // 이미지 하단 밑 그라데이션
                  shaderCallback: (Rect bound) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.transparent],
                      stops: [0.70, 1.0],
                    ).createShader(bound);
                  },
                  blendMode: BlendMode.dstIn,
                  child: FlexibleSpaceBar(
                    //title: Text(book.title),
                    background: PhotoHero(
                      photo: widget.book.url,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: isCheck
                          ? SvgPicture.asset("assets/images/R_Bookmark0_ic.svg")
                          : SvgPicture.asset(
                              "assets/images/R_Bookmark1_ic.svg")),
                  PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        child: ListTile(
                          leading: SvgPicture.asset(
                              'assets/images/E_R_Full screen_ic.svg'),
                          title: Text('전체 화면'),
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                            leading: SvgPicture.asset(
                                'assets/images/E_R_PDF_ic.svg'),
                            title: Text('PDF로 내보내기')),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                            leading: SvgPicture.asset(
                                'assets/images/E_R_Share_ic.svg'),
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
                      title: widget.book.title,
                      size: 18.0,
                    ),
                    SizedBox(height: 300),
                    Center(
                      child: Text(widget.book.date.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 22)),
                    ),
                    SizedBox(height: 70),
                    Container(
                      //alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 25, right: 25),
                      alignment: Alignment.topLeft,
                      child: Text(widget.book.text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _fontSize,
                            height: _fontHeight,
                          )),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              )
            ]),

            // 하단 설정창
            Visibility(
              visible: _isReadSetBarVisible,
              child: Positioned(
                left: MediaQuery.of(context).size.width / 2 - 195,
                bottom: 19,
                child: BookSettingBar(
                  contentBoxVisibility: _contentBoxVisibility,
                  controlBoxVisibility: _controlBoxVisibility,
                  settingBoxVisibility: _settingBoxVisibility,
                ),
              ),
            ),
            Visibility(
              visible: _isControlBoxVisible,
              child: Positioned(
                bottom: 0, // Height of the container
                left: 0,
                child: Container(
                  padding: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width,
                  height: 256,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            width: 130,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '글꼴',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.chevron_left),
                            onPressed: () {},
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                color: Color.fromARGB(118, 109, 109, 109),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    spreadRadius: -10,
                                    blurRadius: 5,
                                    offset: Offset(0, 7),
                                  )
                                ]),
                            alignment: Alignment.center,
                            child: Text(
                              '$_fontStyle',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.chevron_right),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            width: 130,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '글자 크기',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: _sizeDec,
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                color: Color.fromARGB(118, 109, 109, 109),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    spreadRadius: -10,
                                    blurRadius: 5,
                                    offset: Offset(0, 7),
                                  )
                                ]),
                            alignment: Alignment.center,
                            child: Text(
                              '$_fontSize',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: _sizeInc,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            width: 130,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '줄 간격',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: _heightDec,
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                color: Color.fromARGB(118, 109, 109, 109),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    spreadRadius: -10,
                                    blurRadius: 5,
                                    offset: Offset(0, 7),
                                  )
                                ]),
                            alignment: Alignment.center,
                            child: Text(
                              '$_fontHeight',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: _heightInc,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            width: 130,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '설정 초기화',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.transparent,
                            ),
                            onPressed: () {},
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                color: Color.fromARGB(118, 109, 109, 109),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    spreadRadius: -10,
                                    blurRadius: 5,
                                    offset: Offset(0, 7),
                                  )
                                ]),
                            alignment: Alignment.center,
                            child: Text(
                              '초기화',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.transparent),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              _controlBoxVisibility();
                            },
                            child: Text(
                              "확인",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _controlBoxVisibility();
                            },
                            child: Text(
                              "취소",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Visibility(
                visible: _isContentBoxVisible,
                child: Positioned(
                    bottom: 0, // Height of the container
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 256,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          )),
                      child: Container(
                          child: Column(
                        children: [
                          Container(
                            height: 190,
                            // 달력
                            child: SizedBox(
                              width: 200,
                              height: 180,
                              // child: ScrollWheelDatePicker(
                              //   theme: CurveDatePickerTheme(
                              //     wheelPickerHeight: 200.0,
                              //     overlay: ScrollWheelDatePickerOverlay.line,
                              //     itemTextStyle: defaultItemTextStyle
                              //         .copyWith(color: Colors.white),
                              //     overlayColor: Colors.white,
                              //     overAndUnderCenterOpacity: 0.2,
                              //   ),
                              //   startDate: DateTime(2023, 1, 1),
                              //   lastDate: DateTime.now(),
                              // )
                              child: ScrollDatePicker(
                                selectedDate: _selectedDate,
                                minimumDate: DateTime(2023, 1, 1),
                                locale: Locale('ko'),
                                options: DatePickerOptions(
                                  //diameterRatio: 2,
                                  backgroundColor:
                                      Color.fromARGB(1, 30, 30, 30),
                                ),
                                scrollViewOptions: DatePickerScrollViewOptions(
                                    year: ScrollViewDetailOptions(
                                      //label: '년',
                                      margin: const EdgeInsets.only(right: 8),
                                      // textStyle: TextStyle(
                                      //   color:
                                      //       Color.fromARGB(164, 255, 255, 255),
                                      // ),
                                      // selectedTextStyle: TextStyle(
                                      //     color: Color.fromARGB(
                                      //         255, 255, 255, 255)),
                                    ),
                                    month: ScrollViewDetailOptions(
                                      //label: '월',
                                      margin: const EdgeInsets.only(right: 8),
                                    ),
                                    day: ScrollViewDetailOptions(
                                        //label: '일',
                                        )),
                                onDateTimeChanged: (DateTime value) {
                                  setState(() {
                                    _selectedDate = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {
                                  _contentBoxVisibility();
                                },
                                child: Text(
                                  "확인",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _contentBoxVisibility();
                                },
                                child: Text(
                                  "취소",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                    ))),

            Visibility(
                visible: _isSettingBoxVisible,
                child: Positioned(
                    bottom: 0, // Height of the container
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 256,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          )),
                      child: Container(
                          child: Column(
                        children: [
                          Container(
                            height: 190,
                            // 배경색
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {
                                  _settingBoxVisibility();
                                },
                                child: Text(
                                  "확인",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _settingBoxVisibility();
                                },
                                child: Text(
                                  "취소",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                    ))),
          ],
        ),
      ),
    );
  }
}
