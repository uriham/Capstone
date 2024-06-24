import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:capstone/screens/add_edit_book.dart';
import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';

import 'package:capstone/screens/add_edit_book.dart';
import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();

class ReadDiaryScreen extends StatelessWidget {
  const ReadDiaryScreen({
    Key? key,
    required this.todayDiary,
    required this.index,
  }) : super(key: key);

  final Diary todayDiary;
  final int index;

  Future<void> shareDiaryAsPDF(
      BuildContext context, String diaryText, String titleName) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text('Diary Entry by $titleName',
                    style: pw.TextStyle(fontSize: 20)),
                pw.SizedBox(height: 20),
                pw.Text(diaryText),
              ],
            ),
          );
        },
      ),
    );

    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/${titleName.replaceAll(' ', '_')}.pdf';
    final file = File(filePath);

    await file.writeAsBytes(await pdf.save());

    Share.shareFiles([filePath], text: '오늘의 일기를 공유합니다.');
  }

  Future<void> showNameInputDialog(BuildContext context) async {
    final TextEditingController nameController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('제목을 입력하세요'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: '제목'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                final String titleName = nameController.text;
                if (titleName.isNotEmpty) {
                  Navigator.of(context).pop();
                  shareDiaryAsPDF(context, todayDiary.text, titleName);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('제목을 입력해주세요.')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/R_Bookmark0_ic.svg',
                width: 32,
                height: 32,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return AddEditBookScreen(diary: todayDiary, index: index);
              }));
            },
            icon: SvgPicture.asset(
              'assets/images/R_Editmode_ic.svg',
              width: 32,
              height: 32,
            ),
          ),
          PopupMenuButton(
            icon: SvgPicture.asset(
              'assets/images/E_R_M_Kebab Menu_ic.svg',
              width: 32,
              height: 32,
            ),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                child: ListTile(
                  leading: IconButton(
                    icon: SvgPicture.asset('assets/images/E_R_PDF_ic.svg'),
                    onPressed: () {
                      showNameInputDialog(context); // 이름 입력 다이얼로그 호출
                    },
                  ),
                  title: const Text('PDF로 공유하기'),
                  onTap: () {
                    showNameInputDialog(context); // 이름 입력 다이얼로그 호출
                  },
                ),
              ),
              PopupMenuItem<String>(
                child: ListTile(
                  leading: IconButton(
                    icon: SvgPicture.asset('assets/images/E_R_Share_ic.svg'),
                    onPressed: () {
                      // 다른 공유 기능 추가
                    },
                  ),
                  title: const Text('공유하기'),
                ),
              )
            ],
          ),
        ],
        leading: IconButton(
          icon: SvgPicture.asset('assets/images/C_E_back_ic.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          todayDiary.formattedDate,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () {},
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 350,
                  ),
                  Text(
                    todayDiary.formattedDate,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontFamily: 'KoPubWorldBatang_Pro',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      todayDiary.text,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Cinzel Decorative',
                        fontWeight: FontWeight.w400,
                        height: 2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
