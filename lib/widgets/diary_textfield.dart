import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:flutter/material.dart';
import 'package:capstone/data/diarys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiaryTextField extends ConsumerWidget {
  DiaryTextField({super.key, required this.todayDiary,});

  final Diary todayDiary;
  final TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    _textEditingController.text = todayDiary.text;
    return Column(
      children: [
        TextField(
          controller: _textEditingController,
          maxLines: null,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
        ElevatedButton(
          onPressed: () {
              ref.read(diaryProvider.notifier).editTodayDiary(_textEditingController.text);
          },
          child: const Text('수정'),
        ),
        
      ],
    );
  }
}
