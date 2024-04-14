import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/book_provider.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/env.dart';
import 'package:dart_openai/dart_openai.dart';

class DiaryTextField extends ConsumerWidget {
  DiaryTextField({
    super.key,
    required this.todayDiary,
  });

  final Diary todayDiary;
  final TextEditingController _textEditingController = TextEditingController();

  Future<String> _openai(String question) async {
    OpenAI.apiKey = Env.apiKey;
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "Please describe it as beautifully as possible",
        ),
      ],
      role: OpenAIChatMessageRole.assistant,
    );

    // the user message that will be sent to the request.
    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          question,
        ),
      ],
      role: OpenAIChatMessageRole.user,
    );

// all messages to be sent.
    final requestMessages = [
      systemMessage,
      userMessage,
    ];

// the actual request.
    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo-1106",
      seed: 6,
      messages: requestMessages,
      temperature: 0.2,
      maxTokens: 500,
    );

    return chatCompletion.choices.first.message.content![0].toString();

  }

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
                    title: const Text('변환'),
                    content: const Text('정말로 변환하시겠습니까?'),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('Okay'),
                        onPressed: () async{

                          Navigator.of(context).pop();
                          // 오늘의 일기 수정 및 오늘의 책에 내용 추가
                          ref
                              .read(diaryProvider.notifier)
                              .editTodayDiary(_textEditingController.text);
                          final a = await _openai(_textEditingController.text);
                          ref
                              .read(bookProvider.notifier)
                              .addBook(a);
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
