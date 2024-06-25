import 'package:capstone/screens/palette_screen_next.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:capstone/models/character.dart';
import 'package:capstone/widgets/mybook_settingbar.dart';
import 'package:capstone/widgets/photo_hero.dart';
import 'package:capstone/screens/chapter_cover.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wheel_picker/wheel_picker.dart';
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

  final List<String> _fonts = ['KoPubWorldDotum_Pro', 'KoPubWorldBatang_Pro'];
  int _currentIndex = 0;
  double _fontSize = 16.0;
  double _fontHeight = 2.0;

  int _previousIndex = 0;
  double _previousFontSize = 16.0;
  double _previousFontHeight = 2.0;

  void _savePreviousState() {
    _previousIndex = _currentIndex;
    _previousFontSize = _fontSize;
    _previousFontHeight = _fontHeight;
  }

  void _previousFont() {
    setState(() {
      _savePreviousState();
      _currentIndex = (_currentIndex - 1 + _fonts.length) % _fonts.length;
    });
  }

  void _nextFont() {
    setState(() {
      _savePreviousState();
      _currentIndex = (_currentIndex + 1) % _fonts.length;
    });
  }

  void _sizeInc() {
    setState(() {
      _savePreviousState();
      _fontSize += 1;
    });
  }

  void _sizeDec() {
    setState(() {
      _savePreviousState();
      _fontSize -= 1;
    });
  }

  void _heightInc() {
    setState(() {
      _savePreviousState();
      _fontHeight += 0.5;
    });
  }

  void _heightDec() {
    setState(() {
      _savePreviousState();
      _fontHeight -= 0.5;
    });
  }

  void _resetSettings() {
    setState(() {
      _currentIndex = 0;
      _fontSize = 16.0;
      _fontHeight = 2.0;
    });
  }

  void _cancelButton() {
    setState(() {
      _currentIndex = _previousIndex;
      _fontSize = _previousFontSize;
      _fontHeight = _previousFontHeight;
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

  Color _selectedColor = Colors.white;
  Color _cstmColor = Colors.black;
  Color _backgroundColor = Colors.black; // 최종 적용된 배경색
  Color _textColor = Colors.white; // 최종 적용된 텍스트 색상

  void _changeColor(Color color) {
    setState(() {
      _selectedColor = color;
      _cstmColor = (color == Colors.black ||
              color == const Color.fromARGB(255, 44, 44, 44))
          ? Colors.white
          : Colors.black;
    });
  }

  void _applyColor() {
    setState(() {
      _backgroundColor = _selectedColor;
      _textColor = _cstmColor;
    });
  }

  bool areSameDay(DateTime date1, DateTime date2) {
    return date1.day == date2.day && date1.month == date2.month;
  }

  final DateTime _selectedDate = DateTime.now();
  int nowIndex = 0;

  @override
  Widget build(BuildContext context) {
    int chapterIndex = widget.character.chapters
        .indexWhere((chapter) => chapter.text == widget.chap.text);

    const textStyle = TextStyle(fontSize: 15.0, height: 1.5);
    final wheelStyle = WheelPickerStyle(
      size: 200,
      itemExtent: textStyle.fontSize! * textStyle.height!,
      squeeze: 1.25, //항목 압축 정도
      diameterRatio: .8, //휠 픽커 직경 비율
      surroundingOpacity: .25, //휠 픽커 주변 항목 투명도
      magnification: 1.2, //중앙 항목 확대 비율
    );

    Widget itemBuilder(BuildContext context, String title) {
      return Text(title.padLeft(2, '0'), style: textStyle);
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (ctx) => ChapCoverScreen(
                      char: widget.character,
                    )));
      },
      child: GestureDetector(
        onTap: _readSetBarVisibility,
        child: Scaffold(
          backgroundColor: _backgroundColor,
          body: Stack(
            children: [
              SmartRefresher(
                enablePullDown: true,
                onRefresh: () async {
                  // 밑에 있는놈 담당
                  await Future.delayed(const Duration(milliseconds: 1000));
                  if (chapterIndex != 0) {
                    Chapter nextChapter =
                        widget.character.chapters[chapterIndex - 1];
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
                header: const ClassicHeader(
                  completeDuration: Duration(milliseconds: 300),
                  releaseText: '드래그 해서 이전 페이지',
                  refreshingText: 'Loadging',
                ),
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
                        automaticallyImplyLeading: false,
                        leading: IconButton(
                          icon:
                              SvgPicture.asset('assets/images/C_E_back_ic.svg'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        backgroundColor: Colors.transparent,
                        pinned: _fined,
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
                              colors: [
                                Colors.white,
                                _backgroundColor.withOpacity(0)
                              ],
                              stops: const [0.65, 0.9],
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
                          PopupMenuButton(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.54),
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItem<String>(
                                child: ListTile(
                                    //color: Colors.transparent,
                                    leading: SvgPicture.asset(
                                        'assets/images/E_R_PDF_ic.svg'),
                                    title: const Text('PDF로 내보내기')),
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
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              widget.chap.title,
                              style: TextStyle(
                                color: _textColor,
                                fontSize: 29,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 300,
                            ),
                            // Center(
                            //   child: Text(widget.book.date.toString(),
                            //       style: TextStyle(color: Colors.white, fontSize: 22)),
                            // ),
                            // SizedBox(height: 70),
                            Container(
                              //alignment: Alignment.topLeft,
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              alignment: Alignment.topLeft,
                              child: Text(widget.chap.text,
                                  style: TextStyle(
                                    color: _textColor,
                                    fontFamily: _fonts[_currentIndex],
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
                        color: Color(0xFF0E0E0E),
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
                              onPressed: _previousFont,
                            ),
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0)),
                                  color:
                                      const Color.fromARGB(118, 109, 109, 109),
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
                                _currentIndex == 0 ? '바탕체' : '돋움체',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: _fonts[_currentIndex],
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.chevron_right),
                              onPressed: _nextFont,
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
                                  color:
                                      const Color.fromARGB(118, 109, 109, 109),
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
                                  color:
                                      const Color.fromARGB(118, 109, 109, 109),
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
                            InkWell(
                              onTap: _resetSettings,
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0)),
                                    color: const Color.fromARGB(
                                        118, 109, 109, 109),
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
                            color: Color(0xFF0E0E0E),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            )),
                        child: Container(
                            child: Column(
                          children: [
                            SizedBox(
                              height: 190,
                              // 챕터 리스트
                              child: SizedBox(
                                width: 200,
                                height: 180,
                                child: WheelPicker(
                                  itemCount: widget.character.chapters.length,
                                  builder: (context, index) {
                                    return Text(
                                        widget.character.chapters[index].title,
                                        style: textStyle);
                                  },
                                  initialIndex: chapterIndex,
                                  looping: false,
                                  style: wheelStyle,
                                  selectedIndexColor: Colors.white,
                                  onIndexChanged: (index) {
                                    setState(() {
                                      nowIndex = index;
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
                                    print(nowIndex);
                                    Chapter newChapter =
                                        widget.character.chapters[nowIndex];

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChapReaderPage(
                                                    chap: newChapter,
                                                    character:
                                                        widget.character)));
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
                            color: Color(0xFF0E0E0E),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            )),
                        child: Container(
                            child: Column(
                          children: [
                            SizedBox(
                                height: 190,
                                // 배경색
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 155,
                                      height: 95,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(9)),
                                        color: _selectedColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '가나다라\n012345',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: _cstmColor),
                                        ),
                                      ),
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              _buildColorButton(Colors.white),
                                              _buildColorButton(Colors.black),
                                              _buildColorButton(
                                                  const Color.fromARGB(
                                                      255, 44, 44, 44)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              _buildColorButton(
                                                  const Color.fromARGB(
                                                      255, 225, 208, 188)),
                                              _buildColorButton(
                                                  const Color.fromARGB(
                                                      255, 221, 194, 194)),
                                              _buildColorButton(
                                                  const Color.fromARGB(
                                                      255, 172, 204, 208)),
                                            ],
                                          )
                                        ])
                                  ],
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    _settingBoxVisibility();
                                    _applyColor();
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
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    bool isSelected = color == _selectedColor;
    return GestureDetector(
      onTap: () {
        _changeColor(color);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: color,
              //shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
          ),
          if (isSelected)
            Icon(
              Icons.check,
              color: _cstmColor,
            ),
        ],
      ),
    );
  }
}
