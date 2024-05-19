import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();

class ReadDiaryScreen extends ConsumerStatefulWidget {
  const ReadDiaryScreen({super.key,required this.todayDiary,required this.index});

  final Diary todayDiary;
  final int index;

  @override
  ConsumerState<ReadDiaryScreen> createState() => _ReadDiaryScreenState();
}

class _ReadDiaryScreenState extends ConsumerState<ReadDiaryScreen> {
  late TextEditingController _textEditingController;
  

  void _saveDiary() {
    ref
        .read(diaryProvider.notifier)
        .editTodayDiary(_textEditingController.text, widget.index,widget.todayDiary.date,false);
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
  @override
  void initState() {
    _textEditingController = TextEditingController();
    _textEditingController.text = widget.todayDiary.text;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.todayDiary.formattedDate),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            widget.todayDiary.formattedDate,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            controller: _textEditingController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
          const SizedBox(
            height: 10,
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
        ]),
      ),
    );
  }
}
