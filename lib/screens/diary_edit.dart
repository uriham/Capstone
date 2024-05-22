import 'package:flutter/material.dart';
import 'package:prism_test/models/diary.dart';
import 'package:prism_test/models/diary_provider.dart';
import 'package:prism_test/screens/diary_read.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class EditDiaryScreen extends StatelessWidget {
  final Diary diary;

  EditDiaryScreen({required this.diary});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller =
        TextEditingController(text: diary.text);

    final DateTime currentDate = DateTime.now();
    final bool canEdit = diary.date.year == currentDate.year &&
        diary.date.month == currentDate.month &&
        diary.date.day == currentDate.day;

    void goToReadMode() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReadMode(diary: diary),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Edit Diary'), actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReadMode(diary: diary)),
            );
          },
          icon: SvgPicture.asset("assets/images/E_Readmode_ic.svg"),
        ),
      ]),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                DateFormat('yyyy년 MM월 dd일').format(diary.date),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Content'),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                enabled: canEdit, // 수정 제한
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: canEdit
                    ? () {
                        Provider.of<DiaryProvider>(context, listen: false)
                            .updateDiary(
                          Provider.of<DiaryProvider>(context, listen: false)
                              .diaries
                              .indexOf(diary),
                          _controller.text,
                        );
                        Navigator.pop(context);
                      }
                    : null, // 수정 제한
                child: Text('Update Diary'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToReadMode,
        child: Icon(Icons.book),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
