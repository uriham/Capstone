import 'package:flutter/material.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/diary.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();

class AddBookScreen extends ConsumerStatefulWidget {
  const AddBookScreen({super.key});

  @override
  ConsumerState<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends ConsumerState<AddBookScreen> {

  final _textController=  TextEditingController();

  void _saveDiary() {
    ref.read(diaryProvider.notifier).addDiary(Diary(date: DateTime.now(),text: _textController.text));
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
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
        title: Text(formatter.format(DateTime.now())),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            formatter.format(DateTime.now()),
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(controller: _textController,),
          const SizedBox(height: 10,),
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
                        onPressed:_saveDiary,
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