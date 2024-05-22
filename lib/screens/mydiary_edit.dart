import 'package:flutter/material.dart';
import 'package:prism_test/models/diary.dart';
import 'package:intl/intl.dart';
import 'package:prism_test/screens/mydiary_read.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiaryEditPage extends StatefulWidget {
  final Diary diary;

  const DiaryEditPage({super.key, required this.diary});

  @override
  _DiaryEditState createState() => _DiaryEditState();
}

class _DiaryEditState extends State<DiaryEditPage> {
  String get formattedDate {
    return DateFormat('yyyy.MM.dd').format(widget.diary.date);
  }

  String get EditmodeDate {
    return DateFormat('yyyy년 MM월 dd일').format(widget.diary.date);
  }

  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.diary.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            formattedDate,
          ),
          actions: [
            IconButton(
              onPressed: () {
                _saveChanges();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DiaryReadPage(diary: widget.diary)),
                );
              },
              icon: SvgPicture.asset("assets/images/E_Readmode_ic.svg"),
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
        ),
        body: Stack(children: [
          SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: (Column(
                children: [
                  Text(
                    EditmodeDate,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  SizedBox(height: 39),
                  TextField(
                    controller: _textEditingController,
                    onChanged: (text) {
                      // 여기서 변경된 텍스트를 저장할 수 있습니다.
                    },
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ],
              )))
        ]));
  }

  void _saveChanges() {
    // 편집된 내용을 저장하고 Diary 클래스의 리스트를 업데이트합니다.
    final String editedText = _textEditingController.text;
    //widget.diary.text = editedText; // 수정된 텍스트로 업데이트
    //diaryList[0] = widget.diary; // Diary 클래스에서 업데이트 메소드 호출
    Navigator.pop(context); // 수정 완료 후 페이지 닫기
  }
}
