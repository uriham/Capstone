import 'package:capstone/models/diary.dart';
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
  var chatText = '-------Loading-------';
  final TextEditingController _textEditingController = TextEditingController();

  Future _openai() async {
    OpenAI.apiKey = Env.apiKey;
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "한국말로 대답해",
        ),
      ],
      role: OpenAIChatMessageRole.assistant,
    );

    // the user message that will be sent to the request.
    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "안녕 오늘의 기분은 어때?",
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
    print(chatCompletion.choices.first.message); // ...
    print(chatCompletion.systemFingerprint); // ...
    print(chatCompletion.usage.promptTokens); // ...
    print(chatCompletion.id);
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
                    title: Text('Dialog Title'),
                    content: Text('This is the content of the dialog.'),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text('Okay'),
                        onPressed: () {
                          _openai();
                          Navigator.of(context).pop();
                          var a = ref
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
