import 'package:capstone/providers/selected_diary_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/screens/read_diary_screen.dart';

class DiaryListTile extends ConsumerStatefulWidget {
  const DiaryListTile(
      {super.key,
      required this.todayDiary,
      required this.index,
      required this.isLongTaped});

  final Diary todayDiary;
  final int index;
  final bool isLongTaped;

  @override
  ConsumerState<DiaryListTile> createState() => _DiaryListTileState();
}

class _DiaryListTileState extends ConsumerState<DiaryListTile> {
  bool _isChecked = false;

  @override // 다시 실행했을 때 변수 초기화 해주는 함수..?
  void didUpdateWidget(covariant DiaryListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLongTaped != widget.isLongTaped) {
      setState(() {
        _isChecked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: !widget.todayDiary.isUsed,
      trailing: widget.isLongTaped && !widget.todayDiary.isUsed
          ? Checkbox(
              value: _isChecked,
              onChanged: (bool? check) {
                setState(() {
                  _isChecked = !_isChecked;
                  ref
                      .read(selectedDiarysProvider.notifier)
                      .addSelectedDiary(widget.todayDiary);
                  ref.read(selectedDiarysProvider.notifier).printState();
                });
              })
          : null,
     
      onTap: widget.isLongTaped
          ? () {
              setState(() {
                _isChecked = !_isChecked;
                 ref
                      .read(selectedDiarysProvider.notifier)
                      .addSelectedDiary(widget.todayDiary);
                  ref.read(selectedDiarysProvider.notifier).printState();
              });
            }
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ReadDiaryScreen(
                    todayDiary: widget.todayDiary,
                    index: widget.index,
                  ),
                ),
              );
            },
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(widget.todayDiary.text,maxLines: 3,
            style: const TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
