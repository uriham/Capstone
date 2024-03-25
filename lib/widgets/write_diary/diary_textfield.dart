import 'package:capstone/models/diary.dart';
import 'package:flutter/material.dart';


class DiaryTextField extends StatefulWidget {
  const DiaryTextField({super.key,required this.todayDiary});

  final Diary todayDiary;

  @override
  State<DiaryTextField> createState() {
    return _DiaryTextFieldState();
  }
}

class _DiaryTextFieldState extends State<DiaryTextField> {
  final _textController = TextEditingController();

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
                widget.todayDiary.text = _textController.text;
              });
            },
            child: const Text('수정')),
      ],
    );
  }
}
