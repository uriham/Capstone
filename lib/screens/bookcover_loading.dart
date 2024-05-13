import 'package:capstone/models/diary.dart';
import 'package:flutter/material.dart';
import 'package:capstone/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:capstone/data/prompts.dart';
import 'package:capstone/providers/book_provider.dart';
import 'dart:async';

class BookCoverComplete extends ConsumerStatefulWidget {
  const BookCoverComplete({
    Key? key,
    required this.keyword,
    required this.todayDiary,
  }) : super(key: key);

  final String keyword;
  final Diary todayDiary;

  @override
  BookCoverCompleteState createState() => BookCoverCompleteState();
}

class BookCoverCompleteState extends ConsumerState<BookCoverComplete> {
  late Future<List<String>> bookList;
  late Future<String> bookUrl;
  late Future<String> bookText;

  Future<List<String>> _makeBook(String keyword, String content) async {
    final openaiApiKey = Env.apiKey;

    final llm = ChatOpenAI(
      apiKey: openaiApiKey,
      defaultOptions: const ChatOpenAIOptions(
        model: 'gpt-4-turbo-preview',
        temperature: 0,
      ),
    );

    final urlTemplate = exSysmessage;
    const humanTemplate = '{text}';
    const booktemplate = 'make a story funny';

    final urlsystemMessagePrompt =
        SystemChatMessagePromptTemplate.fromTemplate(urlTemplate);

    final humanMessagePrompt =
        HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);

    final booksystemMessagePrompt =
        SystemChatMessagePromptTemplate.fromTemplate(booktemplate);

    final urlchatPrompt = ChatPromptTemplate.fromPromptMessages(
        [urlsystemMessagePrompt, humanMessagePrompt]);

    final bookchatPrompt = ChatPromptTemplate.fromPromptMessages(
        [booksystemMessagePrompt, humanMessagePrompt]);

    final tools = <BaseTool>[
      OpenAIDallETool(
        apiKey: openaiApiKey,
      ),
    ];
    final agent = OpenAIFunctionsAgent.fromLLMAndTools(
      llm: llm,
      tools: tools,
      systemChatMessage: urlsystemMessagePrompt,
    );
    const outputParser = StringOutputParser();

    final chain = bookchatPrompt | llm | outputParser;

    final executor = AgentExecutor(agent: agent);
    final url = await executor.run(keyword);
    final text = await chain.invoke({'text': content});
    print(url);

    return [url, text.toString()];
  }

  Future<String> _maketext(String question) async {
    final openaiApiKey = Env.apiKey;
    const booktemplate = 'make a story funny';
    final booksystemMessagePrompt =
        SystemChatMessagePromptTemplate.fromTemplate(booktemplate);
    const humanTemplate = '{text}';
    final humanMessagePrompt =
        HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);
    final chatPrompt = ChatPromptTemplate.fromPromptMessages(
        [booksystemMessagePrompt, humanMessagePrompt]);
    final model = ChatOpenAI(
      apiKey: openaiApiKey,
      defaultOptions: const ChatOpenAIOptions(model: 'gpt-3.5-turbo'),
    );
    const outputParser = StringOutputParser();

    final chain = chatPrompt | model | outputParser;

    final res = await chain.invoke({'text': question});
    return res.toString();
  }

  @override
  void initState() {
    super.initState();
    bookList = _makeBook(widget.keyword, widget.todayDiary.text);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<List<String>>(
        future: bookList,
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // 'Icons.check_circle_outline'가 나타난 후 2초 뒤에 현재 화면이 pop되고 이전 화면으로 이동
            Future.delayed(Duration(seconds: 2), () {
              Navigator.of(context).pop(snapshot.data);
            });
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.blue,
                    size: 60,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ],
              ),
            );
          } else {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 100, // 상단에 위치
                  left: MediaQuery.of(context).size.width / 2 - 146, // 가운데 정렬
                  child: Container(
                    width: 292,
                    height: 54,
                    padding: const EdgeInsets.only(left: 1.64, bottom: 0.30),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 290.36,
                          height: 53.70,
                          decoration: ShapeDecoration(
                            color: Color(0xFF0E0E0E),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 2, color: Color(0xFFFF2287)),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '오늘의 일기 생성중',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 8), // 텍스트와 화살표 사이 간격 설정
                                _ArrowRotationAnimation(), // 화살표 회전 애니메이션 추가
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: _LoadingText(), // 로딩 텍스트 위젯 추가
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class _ArrowRotationAnimation extends StatefulWidget {
  @override
  _ArrowRotationAnimationState createState() => _ArrowRotationAnimationState();
}

class _ArrowRotationAnimationState extends State<_ArrowRotationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2), // 회전 애니메이션의 지속 시간
      vsync: this,
    )..repeat(); // 애니메이션을 반복합니다.
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        'assets/images/C_Again_ic.png',
        width: 40,
        height: 40,
      ),
    );
  }
}

class _LoadingText extends StatefulWidget {
  @override
  _LoadingTextState createState() => _LoadingTextState();
}

class _LoadingTextState extends State<_LoadingText> {
  int _index = 0;
  List<String> _loadingTexts = [
    '팔월 초하룻날 밤차로 너와 네 연인은 떠나는 것처럼 나한테는 그래놓고 기실은 이튿날 아침차로 가 버렸다. \n\n내가 아무리 이 사회에서 또 우리 가정에서 어른 노릇을 못하는 변변치 못한 인간이라기로서니 그래도 너희들보다야 어른이다.',
    '우리 둘이 떨어지기 어렵소이다. 하고 내게 그야말로 강담판(强談判)을 했다면 낸들 또 어쩌랴. 암만 못한다고 딱 거절했던 일이라도 어머니나 아버지 몰래 너희 둘 안동시켜서 쾌히 전송(餞送)할 내 딴은 이해도 아량도 있다.\n\n 그것을, 나까지 속이고 그랬다는 것을 네 장래의 행복 이외의 아무것도 생각할 줄 모르는 네 큰오빠 나로서 꽤 서운히 생각한다',
    '예정대로 K가 팔월 초하룻날 밤 북행차(北行車)로 떠난다고, 그것을 일러 주려 하룻날 아침에 너와 K 둘이서 나를 찾아왔다.\n\n 요 전날 너희 둘이 의논차 내게 왔을 때 말한 바와 같이 K만 떠나고 옥희 너는 네 큰오빠 나와 함께 K를 전송하기로 한 것인데, 또 일의 순서상 일은 그렇게 하는 것이 옳지 않았더냐'
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 6), (timer) {
      setState(() {
        _index = (_index + 1) % _loadingTexts.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.0),
      child: Text(
        _loadingTexts[_index],
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'KoPubWorldBatang_Pro',
          fontWeight: FontWeight.w300,
          letterSpacing: 0.48,
          color: Colors.white,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
