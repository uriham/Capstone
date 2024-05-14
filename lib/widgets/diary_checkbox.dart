import 'package:flutter/material.dart';

class DiaryCheckBox extends StatefulWidget {
  const DiaryCheckBox({super.key});

  @override
  State<DiaryCheckBox> createState() => _DiaryCheckBoxState();
}

class _DiaryCheckBoxState extends State<DiaryCheckBox> {
  @override
  bool _isChecked = false;

  Widget build(BuildContext context) {
    return Checkbox(value: _isChecked, onChanged: (bool? check){setState(() {
      _isChecked = !_isChecked;
    });});
  }
}