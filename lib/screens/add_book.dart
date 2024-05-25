import 'package:flutter/material.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/diary.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('yyyy.MM.dd');
final formatter2 = DateFormat('yyyy년 MM월 dd일');

class AddBookScreen extends ConsumerStatefulWidget {
  const AddBookScreen({super.key});

  @override
  ConsumerState<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends ConsumerState<AddBookScreen> {
  final _textController = TextEditingController();

  void _saveDiary() {
    ref
        .read(diaryProvider.notifier)
        .addDiary(Diary(date: DateTime.now(), text: _textController.text));
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
          icon: SvgPicture.asset('assets/images/C_E_back_ic.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(formatter.format(DateTime.now())),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            formatter2.format(DateTime.now()),
            style: const TextStyle(
              fontSize: 23,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
          Container(width: double.infinity,height: 2,color: Colors.white,),
          TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            controller: _textController,
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
