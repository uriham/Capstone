import 'package:capstone/models/diary.dart';
import 'package:flutter/material.dart';

class DiaryTextField extends StatefulWidget {
  const DiaryTextField({super.key, required this.todayDairy});

  final Diary todayDairy;

  @override
  State<StatefulWidget> createState() {
    return _DiaryTextFieldState();
  }
}

class _DiaryTextFieldState extends State<DiaryTextField> {
  TextEditingController? _textController;

  @override
  void initState() {
    _textController = TextEditingController(text: widget.todayDairy.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      maxLines: null,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
