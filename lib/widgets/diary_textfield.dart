import 'package:capstone/models/diary.dart';
import 'package:flutter/material.dart';
import 'package:capstone/data/diarys.dart';

class DiaryTextField extends StatefulWidget {
  const DiaryTextField({super.key, required this.todayDiary,required this.onPressed});

  final Diary todayDiary;
  final void Function() onPressed;

  @override
  State<DiaryTextField> createState() {
    return _DiaryTextFieldState();
  }
}

class _DiaryTextFieldState extends State<DiaryTextField> {
  final _textController = TextEditingController();
  final Diary todayDiary = allDiarys[0];

  @override
  void initState() {
    super.initState();
    _textController.text = widget.todayDiary.text;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(allDiarys[0].text);
    return Column(
      children: [
        TextField(
          controller: _textController,
          maxLines: null,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            
            setState(() {
              todayDiary.text = _textController.text;
              widget.onPressed();
            });
           
          },
          child: const Text('수정'),
        ),
        
      ],
    );
  }
}
