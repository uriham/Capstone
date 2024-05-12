import 'package:flutter/material.dart';
import 'package:prism_test/widgets/mybook_settingbar.dart';

class ContentBar extends StatefulWidget {
  ContentBar({super.key, required this.contentBoxVisibility});

  final Function contentBoxVisibility;

  @override
  _ContentBarState createState() => _ContentBarState();
}

class _ContentBarState extends State<ContentBar> {
  bool _isContentBarVisible = false;

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

  // void _toggleBoxVisibility() {
  //   setState(() {
  //     _isContentBarVisible = !_isContentBarVisible;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
                  //_toggleBoxVisibility();
                  setState(() {
                    setState(() {
                      widget.contentBoxVisibility();
                    });
                  });
                },
                child: Text(
                  "확인",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {
                  //_toggleBoxVisibility();
                  setState(() {
                    setState(() {
                      widget.contentBoxVisibility();
                    });
                  });
                },
                child: Text("취소"),
              )
            ],
          )
        ],
      ),
    );
  }
}
