import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/book_provider.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/env.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:capstone/data/prompts.dart';

class DiaryTextField extends ConsumerStatefulWidget {
  const DiaryTextField({super.key, required this.todayDiary});

  final Diary todayDiary;

  @override
  DiaryTextFieldState createState() {
    return DiaryTextFieldState();
  }
}

class DiaryTextFieldState extends ConsumerState<DiaryTextField> {
  late TextEditingController _textEditingController;

  void _saveDiary() {
    Navigator.of(context).pop();
    ref.read(diaryProvider.notifier).editTodayDiary(_textEditingController.text);
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.text = widget.todayDiary.text;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          TextField(
            style: const TextStyle(color: Colors.white),
            controller: _textEditingController,
            maxLines: null,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('변환'),
                    content: const Text('정말로 변환하시겠습니까?'),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: _saveDiary,
                        child: const Text('Okay'),
                      ),
                      TextButton(
                        child: const Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('수정'),
          ),
        ],
      ),
    );
  }
}
