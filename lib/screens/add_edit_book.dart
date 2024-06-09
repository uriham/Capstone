import 'package:capstone/screens/tab.dart';
import 'package:flutter/material.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/diary.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('yyyy.MM.dd');
final formatter2 = DateFormat('yyyy년 MM월 dd일');

class AddEditBookScreen extends ConsumerStatefulWidget {
  AddEditBookScreen({super.key, this.diary, this.index});

  Diary? diary;
  int? index;

  @override
  ConsumerState<AddEditBookScreen> createState() => _AddEditBookScreenState();
}

class _AddEditBookScreenState extends ConsumerState<AddEditBookScreen> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.text = widget.diary == null ? '' : widget.diary!.text;
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  void _editDiary() {
    ref.read(diaryProvider.notifier).editTodayDiary(
        _textController.text, widget.index!, widget.diary!.date, false);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return const TabScreen();
    }));
  }

  void _saveDiary() {
    ref
        .read(diaryProvider.notifier)
        .addDiary(Diary(date: DateTime.now(), text: _textController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                content: const Text(
                  '저장하시겠습니까?',
                  style: TextStyle(color: Colors.white),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      widget.diary == null ? _saveDiary() : _editDiary();
                    },
                    child: const Text('Okay'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('Close'),
                  )
                ],
              );
            });
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset('assets/images/C_E_back_ic.svg'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: widget.diary == null
              ? Text(
                  formatter.format(DateTime.now()),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Text(
                  formatter.format(widget.diary!.date),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                icon: SvgPicture.asset('assets/images/D_Mybook_ic.svg'),
                onPressed: () {
                  // 읽기 모드로?
                }),
            IconButton(
              icon: const Icon(Icons.save), // 여기 뭐하지
              onPressed: () {
                // 저장 버튼 눌렀을 때 수행할 동작
                showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        content: const Text(
                          '저장하시겠습니까?',
                          style: TextStyle(color: Colors.white),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              widget.diary == null
                                  ? _saveDiary()
                                  : _editDiary();
                            },
                            child: const Text('Okay'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text('Close'),
                          )
                        ],
                      );
                    });
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.diary == null
                  ? formatter2.format(DateTime.now())
                  : formatter2.format(widget.diary!.date),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.white,
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              controller: _textController,
              style:
                  const TextStyle(color: Colors.white, fontSize: 16, height: 2),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
