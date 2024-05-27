import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:capstone/models/character.dart';
import 'package:capstone/widgets/mybook_settingbar.dart';
import 'package:capstone/widgets/photo_hero.dart';
import 'package:capstone/widgets/title_hero.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:capstone/models/chapter.dart';

class ChapReaderPage extends StatefulWidget {
  final Chapter chap;
  final Character character;

  const ChapReaderPage(
      {super.key, required this.chap, required this.character});

  @override
  State<ChapReaderPage> createState() => _BookReadState();
}

class _BookReadState extends State<ChapReaderPage> {
  final _refreshController = RefreshController(initialRefresh: false);

  static bool isCheck = false;
  bool _isReadSetBarVisible = false;
  bool _isContentBoxVisible = false;
  bool _isControlBoxVisible = false;
  bool _isSettingBoxVisible = false;
  bool _fined = false;

  final FontStyle _fontStyle = FontStyle.normal;
  double _fontSize = 16.0;
  double _fontHeight = 2;
  final Color _textColor = Colors.black;

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
      _fined = !_fined;
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
    int chapterIndex = widget.character.chapters
        .indexWhere((chapter) => chapter.text == widget.chap.text);
    return GestureDetector(
      onTap: _readSetBarVisibility,
      child: Scaffold(
        body: Stack(
          children: [
            SmartRefresher(
              enablePullDown: false,
              onLoading: () async {
                // 밑에 있는놈 담당
                await Future.delayed(const Duration(milliseconds: 1000));
                if (chapterIndex != -1 &&
                    chapterIndex < widget.character.chapters.length - 1) {
                  Chapter nextChapter =
                      widget.character.chapters[chapterIndex + 1];
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (ctx) {
                    return ChapReaderPage(
                        chap: nextChapter, character: widget.character);
                  }));
                  _refreshController.loadComplete();
                } else {
                  _refreshController.loadComplete();
                }
              },
              controller: _refreshController,
              enablePullUp: true,
              footer: const ClassicFooter(
                spacing: 3,
                loadingText: 'Loading',
                canLoadingText: '드래그해서 다음 페이지',
                idleText: '',
              ),
              child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  //physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: _fined,
                      snap: false,
                      floating: false,
                      expandedHeight: 620,
                      elevation: 0,
                      flexibleSpace: ShaderMask(
                        // 이미지 하단 밑 그라데이션
                        shaderCallback: (Rect bound) {
                          return const LinearGradient(
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
                            photo: widget.chap.chImg,
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
                                ? SvgPicture.asset(
                                    "assets/images/R_Bookmark0_ic.svg")
                                : SvgPicture.asset(
                                    "assets/images/R_Bookmark1_ic.svg")),
                        PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (BuildContext context) => [
                            // PopupMenuItem(
                            //   child: ListTile(
                            //     leading: SvgPicture.asset(
                            //         'assets/images/E_R_Full screen_ic.svg'),
                            //     title: Text('전체 화면'),
                            //   ),
                            // ),
                            PopupMenuItem<String>(
                              child: Container(
                                  color: Colors.transparent,
                                  // leading: SvgPicture.asset(
                                  //     'assets/images/E_R_PDF_ic.svg'),
                                  child: const Text('PDF로 내보내기')),
                            ),
                            PopupMenuItem(
                              child: ListTile(
                                  leading: SvgPicture.asset(
                                      'assets/images/E_R_Share_ic.svg'),
                                  title: const Text('공유하기')),
                            ),
                          ],
                          onSelected: (value) {},
                        )
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          Text(
                            widget.chap.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 29,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 300),
                          // Center(
                          //   child: Text(widget.book.date.toString(),
                          //       style: TextStyle(color: Colors.white, fontSize: 22)),
                          // ),
                          // SizedBox(height: 70),
                          Container(
                            //alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            alignment: Alignment.topLeft,
                            child: Text(widget.chap.text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: _fontSize,
                                  height: _fontHeight,
                                )),
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    )
                  ]),
            ),

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
                  padding: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width,
                  height: 256,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
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
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            width: 130,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '글꼴',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'KoPubWorldDotum_Pro',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {},
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                                color: const Color.fromARGB(118, 109, 109, 109),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    spreadRadius: -10,
                                    blurRadius: 5,
                                    offset: const Offset(0, 7),
                                  )
                                ]),
                            alignment: Alignment.center,
                            child: Text(
                              '$_fontStyle',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'KoPubWorldDotum_Pro',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.chevron_right),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            width: 130,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '글자 크기',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'KoPubWorldDotum_Pro',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: _sizeDec,
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                                color: const Color.fromARGB(118, 109, 109, 109),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    spreadRadius: -10,
                                    blurRadius: 5,
                                    offset: const Offset(0, 7),
                                  )
                                ]),
                            alignment: Alignment.center,
                            child: Text(
                              '$_fontSize',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'KoPubWorldDotum_Pro',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: _sizeInc,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            width: 130,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '줄 간격',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'KoPubWorldDotum_Pro',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: _heightDec,
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                                color: const Color.fromARGB(118, 109, 109, 109),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    spreadRadius: -10,
                                    blurRadius: 5,
                                    offset: const Offset(0, 7),
                                  )
                                ]),
                            alignment: Alignment.center,
                            child: Text(
                              '$_fontHeight',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'KoPubWorldDotum_Pro',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: _heightInc,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            width: 130,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '설정 초기화',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'KoPubWorldDotum_Pro',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.transparent,
                            ),
                            onPressed: () {},
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                                color: const Color.fromARGB(118, 109, 109, 109),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    spreadRadius: -10,
                                    blurRadius: 5,
                                    offset: const Offset(0, 7),
                                  )
                                ]),
                            alignment: Alignment.center,
                            child: const Text(
                              '초기화',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'KoPubWorldDotum_Pro',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add,
                                color: Colors.transparent),
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
                            child: const Text(
                              "확인",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _controlBoxVisibility();
                            },
                            child: const Text(
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
                      padding: const EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 256,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          )),
                      child: Container(
                          child: Column(
                        children: [
                          SizedBox(
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
                                locale: const Locale('ko'),
                                options: const DatePickerOptions(
                                  //diameterRatio: 2,
                                  backgroundColor:
                                      Color.fromARGB(1, 30, 30, 30),
                                ),
                                scrollViewOptions:
                                    const DatePickerScrollViewOptions(
                                        year: ScrollViewDetailOptions(
                                          //label: '년',
                                          margin: EdgeInsets.only(right: 8),
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
                                          margin: EdgeInsets.only(right: 8),
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
                                child: const Text(
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
                                child: const Text(
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
                      padding: const EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 256,
                      decoration: const BoxDecoration(
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
                                child: const Text(
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
                                child: const Text(
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
