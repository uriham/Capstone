import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/book_provider.dart';
import 'package:capstone/providers/diary_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/env.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

class DiaryTextField extends ConsumerWidget {
  DiaryTextField({
    super.key,
    required this.todayDiary,
  });

  final Diary todayDiary;
  final TextEditingController _textEditingController = TextEditingController();

  Future<String> _example2() async {
    final openaiApiKey = Env.apiKey;
    final llm = ChatOpenAI(
      apiKey: openaiApiKey,
      defaultOptions: const ChatOpenAIOptions(
        model: 'gpt-4-turbo-preview',
        temperature: 0,
      ),
    );
    final tools = <BaseTool>[
      OpenAIDallETool(
        apiKey: openaiApiKey,
      ),
    ];
    final agent = OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: tools);
    final executor = AgentExecutor(agent: agent);
    final res = await executor.run(
      'windows'
      'Return ONLY the URL of the image. Do not add any explanation.',
    );
    return res.toString();
  }

  Future<String> _openai(String question) async {
    final openaiApiKey = Env.apiKey;
    const template =
        'You are a cat that watch me.';
    final systemMessagePrompt =
        SystemChatMessagePromptTemplate.fromTemplate(template);
    const humanTemplate = '{text}';
    final humanMessagePrompt =
        HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);
    final chatPrompt = ChatPromptTemplate.fromPromptMessages(
        [systemMessagePrompt, humanMessagePrompt]);
    final model = ChatOpenAI(
        apiKey: openaiApiKey,
        defaultOptions: const ChatOpenAIOptions(model: 'gpt-4-turbo-preview'));
    const outputParser = StringOutputParser();

    final chain = chatPrompt | model | outputParser;

    final res = await chain.invoke({
      'text': question
    });
    return res.toString();
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
                        onPressed: () async {
                          Navigator.of(context).pop();
                          // 오늘의 일기 수정 및 오늘의 책에 내용 추가
                          ref.read(diaryProvider.notifier).editTodayDiary(
                              _textEditingController
                                  .text); //datetime을 제대로 넣어야 한다.
                          final a = await _example2(); // url 획득
                          final b = await _openai(_textEditingController.text);
                          ref
                              .read(bookProvider.notifier)
                              .addBook(b, a, todayDiary.date);
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
