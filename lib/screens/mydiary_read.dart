import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:prism_test/models/diary.dart';
import 'package:prism_test/screens/mydiary_edit.dart';
import 'package:prism_test/widgets/mybook_settingbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:scroll_wheel_date_picker/scroll_wheel_date_picker.dart';

class DiaryReadPage extends StatefulWidget {
  final Diary diary;

  const DiaryReadPage({super.key, required this.diary});

  @override
  _DiaryReadState createState() => _DiaryReadState();
}

class _DiaryReadState extends State<DiaryReadPage> {
  String get formattedDate {
    return DateFormat('yyyy.MM.dd').format(widget.diary.date);
  }

  static bool isCheck = false;
  bool _isReadSetBarVisible = false;
  bool _isContentBoxVisible = false;
  bool _isControlBoxVisible = false;
  bool _isSettingBoxVisible = false;

  FontStyle _fontStyle = FontStyle.normal;
  double _fontSize = 15.0;
  double _fontHeight = 1.5;

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

  Color _selectedColor = Colors.white;
  Color _cstmColor = Colors.black;
  Color _backgroundColor = Colors.transparent; // 최종 적용된 배경색
  Color _textColor = Colors.white; // 최종 적용된 텍스트 색상

  //Color _previousColor; // 변경 전 색상을 저장하는 변수
  //Color _previousTextColor; // 변경 전 텍스트 색상을 저장하는 변수

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
        appBar: AppBar(
          title: Text(formattedDate, style: TextStyle(color: _textColor)),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isCheck = !isCheck;
                  });
                },
                icon: isCheck
                    ? SvgPicture.asset("assets/images/R_Bookmark0_ic.svg")
                    : SvgPicture.asset("assets/images/R_Bookmark1_ic.svg")),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DiaryEditPage(diary: widget.diary)),
                );
              },
              icon: SvgPicture.asset("assets/images/R_Editmode_ic.svg"),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  child: Container(
                      color: Colors.transparent,
                      // leading: SvgPicture.asset(
                      //     'assets/images/E_R_PDF_ic.svg'),
                      child: Text('PDF로 내보내기')),
                ),
                PopupMenuItem(
                  child: ListTile(
                      leading:
                          SvgPicture.asset('assets/images/E_R_Share_ic.svg'),
                      title: Text('공유하기')),
                ),
              ],
              onSelected: (value) {},
            )
          ],
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Container(
              color: _backgroundColor,
              child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: (Column(
                    children: [
                      SizedBox(
                        height: 280,
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 29,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 47),
                      Text(widget.diary.text,
                          style: TextStyle(
                            fontSize: _fontSize,
                            color: _textColor,
                            height: _fontHeight,
                          ))
                    ],
                  ))),
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
                          Text(
                            '배경색',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                              height: 175,
                              // 배경색
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 155,
                                    height: 95,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(9)),
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
                                            _buildColorButton(Color.fromARGB(
                                                255, 44, 44, 44)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            _buildColorButton(Color.fromARGB(
                                                255, 225, 208, 188)),
                                            _buildColorButton(Color.fromARGB(
                                                255, 221, 194, 194)),
                                            _buildColorButton(Color.fromARGB(
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
            margin: EdgeInsets.all(10.0),
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: color,
              //shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5)),
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
