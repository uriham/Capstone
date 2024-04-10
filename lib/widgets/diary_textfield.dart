import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiaryTextField extends ConsumerWidget {
  DiaryTextField({
    super.key,
    required this.todayDiary,
  });

  final Diary todayDiary;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _textEditingController.text = todayDiary.text;
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
                    title: Text('Dialog Title'),
                    content: Text('This is the content of the dialog.'),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text('Okay'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          ref
                              .read(diaryProvider.notifier)
                              .editTodayDiary(_textEditingController.text);
                        },
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
