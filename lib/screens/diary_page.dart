import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:capstone/models/diary.dart';

class DiaryPage extends ConsumerStatefulWidget {
  final DateTime date;

  DiaryPage({required this.date});

  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends ConsumerState<DiaryPage> {
  late TextEditingController _textController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    final diaries = ref.read(diaryProvider);
    final selectedDiary = diaries.firstWhere(
      (diary) => diary.date == widget.date,
      orElse: () => Diary(date: widget.date, text: ''),
    );
    _textController = TextEditingController(text: selectedDiary.text);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _saveDiary() {
    final diaries = ref.read(diaryProvider);
    final diaryNotifier = ref.read(diaryProvider.notifier);
    final selectedDiaryIndex =
        diaries.indexWhere((diary) => diary.date == widget.date);

    if (selectedDiaryIndex != -1) {
      diaryNotifier.editTodayDiary(
        _textController.text,
        selectedDiaryIndex,
        widget.date,
        diaries[selectedDiaryIndex].isUsed,
      );
    } else {
      diaryNotifier
          .addDiary(Diary(date: widget.date, text: _textController.text));
    }

    setState(() {
      _isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('일기가 저장되었습니다.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final diaries = ref.watch(diaryProvider);
    final selectedDiary = diaries.firstWhere(
      (diary) => diary.date == widget.date,
      orElse: () =>
          Diary(date: widget.date, text: 'No diary entry for this date.'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${widget.date.year}-${widget.date.month}-${widget.date.day}의 일기'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              if (_isEditing) {
                _saveDiary();
              } else {
                setState(() {
                  _isEditing = true;
                });
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isEditing
            ? TextField(
                controller: _textController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: '일기를 입력하세요...',
                  border: OutlineInputBorder(),
                ),
              )
            : Text(selectedDiary.text),
      ),
    );
  }
}
