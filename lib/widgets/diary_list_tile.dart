import 'package:capstone/providers/selected_diary_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/diary.dart';
import 'package:capstone/screens/read_diary_screen.dart';
import 'package:capstone/widgets/checkbox.dart';

class DiaryListTile extends ConsumerStatefulWidget {
  const DiaryListTile(
      {super.key,
      required this.todayDiary,
      required this.index,
      required this.isGenerating});

  final Diary todayDiary;
  final int index;
  final bool isGenerating;

  @override
  ConsumerState<DiaryListTile> createState() => _DiaryListTileState();
}

class _DiaryListTileState extends ConsumerState<DiaryListTile> {
  bool _isChecked = false;

  @override // 다시 실행했을 때 변수 초기화 해주는 함수..?
  void didUpdateWidget(covariant DiaryListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isGenerating != widget.isGenerating) {
      setState(() {
        _isChecked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 6, 0, 0),
      child: Stack(children: [
        ListTile(
          enabled: !widget.todayDiary.isUsed,
          /*
          trailing: widget.isGenerating && !widget.todayDiary.isUsed
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
              */
          onTap: widget.isGenerating
              ? () {
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                  ref
                      .read(selectedDiarysProvider.notifier)
                      .addSelectedDiary(widget.todayDiary);
                  ref.read(selectedDiarysProvider.notifier).printState();
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
            alignment: Alignment.topLeft,
            child: Text(widget.todayDiary.text,
                maxLines: 4,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'KoPubWorldDotum_Pro',
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 10,
            child: widget.isGenerating && !widget.todayDiary.isUsed
                ? CustomCheckbox(isCheck: _isChecked)
                : const SizedBox(
                    height: 1,
                  ))
      ]),
    );
  }
}
