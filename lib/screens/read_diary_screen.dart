import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();

class ReadDiaryScreen extends ConsumerStatefulWidget {
  const ReadDiaryScreen(
      {super.key, required this.todayDiary, required this.index});

  final Diary todayDiary;
  final int index;

  @override
  ConsumerState<ReadDiaryScreen> createState() => _ReadDiaryScreenState();
}

class _ReadDiaryScreenState extends ConsumerState<ReadDiaryScreen> {
  late TextEditingController _textEditingController;

  void _saveDiary() {
    ref.read(diaryProvider.notifier).editTodayDiary(_textEditingController.text,
        widget.index, widget.todayDiary.date, false);
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/R_Bookmark0_ic.svg',
                width: 32,
                height: 32,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/R_Editmode_ic.svg',
              width: 32,
              height: 32,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/E_R_M_Kebab Menu_ic.svg',
                width: 32,
                height: 32,
              )),
        ],
        leading: IconButton(
          icon: SvgPicture.asset('assets/images/C_E_back_ic.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.todayDiary.formattedDate),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            const SizedBox(
              height: 300,
            ),
            Text(
              widget.todayDiary.formattedDate,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 65,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: _textEditingController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
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
      ),
    );
  }
}
