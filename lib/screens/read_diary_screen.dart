import 'package:capstone/screens/add_edit_book.dart';
import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';

final formatter = DateFormat.yMMMd();

class ReadDiaryScreen extends ConsumerWidget {
  const ReadDiaryScreen(
      {super.key, required this.todayDiary, required this.index});

  final Diary todayDiary;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      //pdf 파일 저장
                    },
                  ),
                  title: Text('PDF로 내보내기'),
                ),
              ),
              PopupMenuItem<String>(
                child: ListTile(
                  leading: IconButton(
                    icon: SvgPicture.asset('assets/images/E_R_Share_ic.svg'),
                    onPressed: () {
                      //공유
                    },
                  ),
                  title: Text('공유하기'),
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
                        softWrap: true,
                        todayDiary.text,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Cinzel Decorative',
                            fontWeight: FontWeight.w400,
                            height: 2),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
