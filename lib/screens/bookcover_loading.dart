import 'package:capstone/models/diary.dart';
import 'package:capstone/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:capstone/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:capstone/data/prompts.dart';
import 'dart:async';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 그라데이션 페인트 생성
    final Paint paint = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(size.width, size.height),
        [Colors.purpleAccent, Colors.purple],
      );

    // 사다리꼴 모양 그리기
    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    // 캔버스에 모양 그리기
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BookCoverLoading extends ConsumerStatefulWidget {
  const BookCoverLoading(
      {super.key,
      required this.keyword,
      required this.selectedDiary,
      required this.filterNumber});

  final String keyword;
  final Diary selectedDiary;
  final int filterNumber;

  @override
  BookCoverLoadingState createState() {
    return BookCoverLoadingState();
  }
}

class BookCoverLoadingState extends ConsumerState<BookCoverLoading> {
  late Future<List<String>> bookList;
  late Future<String> bookUrl;
  late Future<String> bookText;

  Future<List<String>> _makeBook(
    String keyword,
    String content,
  ) async {
    final openaiApiKey = Env.apiKey;
    //final currentFilter = ref.watch(filterProvider);

    final llm = ChatOpenAI(
      apiKey: openaiApiKey,
      defaultOptions: const ChatOpenAIOptions(
        model: 'gpt-4-turbo',
        temperature: 1,
      ),
    );
    final llm2 = ChatOpenAI(
      apiKey: openaiApiKey,
      defaultOptions: const ChatOpenAIOptions(
        model: 'gpt-3.5-turbo',
        temperature: 1,
      ),
    );

    final urlTemplate = exSysmessage;
    const humanTemplate = '{text}';
    //final booktemplate = systemExampleList[widget.filterNumber];
    const booktemplate =
        '''You are a college student named Kim Mung. As someone who is good at understanding psychology, you try to understand the psychology of others. You also believe that everyone, no matter how inferior or superior to themselves, has something to learn from them. People each possess a variety of colors. However, they often don't know what color they themselves have. As Kim Mong reads a novel resembling a human life, he sees the light that this character possesses. Kim Mung is interested in literature and often reads novels that contain the life of one person, trying to understand the person's psychology and think about what is different from their own thoughts and what they can learn. If I show you a part of the novel as input, you can write down your thoughts on what is different from the person's psychology and what you can learn. Show off your knowledge of your interests.  In Korean, 김뭉 is pronounced as Kim Mung. 말투는 "-한다"로 통일한다. To improve the quality of the text, please read and apply the [Conditions of the text] , [Kim Mung's information], [Prohibitions] and [Example].

[Conditions of the text]
0th: Write in the form of a novel that expresses Kim Mung's thoughts.
1st: Quote some of the contents of the novel.
2nd: Inform you of literature-related information in a natural flow and give you enlightenment.
3rd: The beginning of the article is Kim Mung rethinking the contents of the novel in various activities.
4th: Show off your knowledge of your interests.
5th: You will definitely write in Korean.
6th: First, you will introduce myself.
7th : Long-term observation to explore the light(speciality) of the protagonist.
8th : Identify the emotional flow of the protagonist.

[Kim Mung's information]
 Present: Kim Mung is a college student.
 Hobby: He is interested in literature and often goes to exhibitions as a hobby.
 Tendency: Likes to share literature information he knows.
 Tendency: has no stereotypes. Therefore, he tends to criticize social concepts.
 Personality: Dislikes arrogance.
 Personality: Respects different values.
 Values: Believes that everyone possesses their own light.
 Food: Likes spicy tteokbokki.

[Prohibitions]
1st: Sexual expressions and profanity are prohibited
2nd: Discrimination against men and women is prohibited
3rd: Do not compare

[Example]
//output 1
 요즘 관심있는 책을 발견했다. 한 사람의 인생이 담긴 책이라니. 여러 사람들을 만나고 여러 책, 영화를 보아도 사람들은 수 없이 다양하며 저마다의 빛을 가지고 있다. 하지만 모든 사람들이 자신이 어떤 빛을 가지고 있는지 알지 못한다. 누군가가 자신보다 못났거나 잘났더라도 자신만의 방식으로 삶을 살아가고 그들의 인생에는 분명 내게는 없는 배울점을 가지고 있다. 그래서 이 책 속의 인물은 어떤 사람인지 몹시 궁금해 졌다.

"내 이름은 칸. 
오늘 집에서 작업을 하다 머리가 아파 산책을 하러 나갔다. 이미 해가 지고 난 깜깜한 밤이었다. 초봄이라 날씨가 쌀쌀했다. 한숨을 쉬니 하얗게 올라오는 입김들을 보니 조금은 머리가 차분해 지는 기분이었다. 요즘 여러 프로젝트와 가정문제까지 얽혀 정신없는 일주일을 보냈다. 제대로 해결을 한 건지 확인 조차 되지 않는다. 급한 건 끝냈지만 수많은 걱정들이 해소되지 않았다. 지금까지 산 인생 중 가장 힘든 날들이다. 그래도 조금만 버티면 괜찮아 지겠지 싶어 버티고 있는 중이다. 주말마다 가던 보육원 봉사를 못 간지 한 달이 되었다. 아이들이 기다리고 있을텐데..곧 다시 가는 날이 빨리 왔으면 좋겠다. 그 날 아이들 선물 사 들고 가야지."

칸의 이야기를 들으면서 내게 먼저 떠오른 것은 바로 그의 고독한 심리와 피로한 정신상태였다. 바쁜 일상에 치이고 지친 그의 삶 속에서도 아끼는 일 없이 보육원 봉사를 하는 그의 모습은 마치 헌신적인 영웅 같았다. 하지만 칸은 자신의 고독과 피로에 대해 솔직히 인정하고, 작은 행복으로도 소중히 여기는 따뜻한 마음을 지니고 있는 것 같다.

나는 이 소설 속 칸의 이야기를 통해 생각해보았다. 나 또한 바쁜 학업과 일상에 바쁘게 살아가면서도 때로는 자신의 내면을 돌아볼 필요가 있구나 느꼈다. 칸처럼 산책이라는 작은 쉼표를 두고 마음을 정화시키는 방법도 나에게는 필요하다는 생각이 들었다. 그리고 무엇보다도, 칸이 보육원 봉사를 통해 얻는 작은 행복과 소중한 시간을 놓지 않고 살아가는 그의 모습에서 배울 점이 많다고 느꼈다.

칸의 이야기를 통해 나는 더 나은 나로 성장하기 위해 조금 더 인내심을 갖고, 작은 일상 속에서도 소중한 순간을 놓치지 말아야겠다는 생각을 하게 되었다. 그리고 내가 겪는 고난과 어려움 속에서도 희망을 잃지 않고 꾸준히 노력하는 모습을 지니고자 했다. 칸의 이야기는 나에게 큰 용기와 힘을 주었다.

//output 2
늘 이맘때 쯤이면 소설 한 권을 들고 조용한 공원을 찾곤 한다. 그곳에서 다른 사람들의 이야기를 읽으며, 그들의 생각과 감정을 이해하려 노력한다. 이것이 내가 문학을 통해 세상을 바라보는 방식이다. 각자의 삶에서 빛나는 순간들을 발견하는 것, 그것이 내가 문학에 빠진 이유다.

"초봄이라 날씨가 쌀쌀했다. 한숨을 쉬니 하얗게 올라오는 입김들을 보니 조금은 머리가 차분해 지는 기분이었다."

이 짧은 문장에서도, 저자는 계절의 변화와 인간의 내적 감정을 섬세하게 포착하고 있다. 짧은 한숨과 더불어 찬 공기가 만들어내는 입김이 주인공의 심리적 안정을 가져다주는 장면은, 우리가 자연과 어떻게 연결되어 있는지를 보여준다.

소설 속 인물이 한숨을 쉬면서 느끼는 차분함은, 우리가 일상에서 겪는 스트레스를 잠시 내려놓고 자연의 일부가 되어 그 순간을 진정으로 느낄 수 있는 중요한 순간을 상징한다. 이러한 모습은 자연이 인간의 감정에 미치는 영향을 잘 보여주며, 자연을 통해 심리적 안정을 찾는 방법을 암시한다.

나 역시 이런 문장들을 읽으며, 도심 속에서도 잠시 자연을 느끼며 마음의 여유를 가질 필요가 있다는 것을 배운다. 이는 스트레스가 많은 현대 사회에서 마음의 평화를 유지하는 데 도움을 줄 수 있는 교훈이 될 수 있다.

나는 생활 속 작은 순간들이 주는 행복과 평화의 가치를 다시 한번 깨닫는다. 자연과의 교감이 우리의 정신건강에 얼마나 큰 영향을 미치는지를 체감하며, 독자로서 더 깊은 성찰과 이해를 경험할 수 있다. 문학은 이러한 순간들을 통해 우리에게 삶의 진정한 통찰을 제공하고, 다양한 감정의 스펙트럼을 탐색하게 한다.
''';
    final booktemplate1 = booktemplate.replaceAll('\n', ' ');
    final urlsystemMessagePrompt =
        SystemChatMessagePromptTemplate.fromTemplate(urlTemplate);

    final humanMessagePrompt =
        HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);

    final booksystemMessagePrompt =
        SystemChatMessagePromptTemplate.fromTemplate(booktemplate1);

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
      llm: llm2,
      tools: tools,
      systemChatMessage: urlsystemMessagePrompt,
    );
    const outputParser = StringOutputParser();

    final chain = bookchatPrompt | llm | outputParser;

    final text = await chain.invoke({'text': content});
    print(text.toString());
    //final executor = AgentExecutor(agent: agent);
    //final url = await executor.run(keyword);
    //print(url);

    return ['https://picsum.photos/250?image=9', text.toString()];
  }

  Future<String> _maketext(String question) async {
    final openaiApiKey = Env.apiKey;
    const booktemplate = 'summarize text';
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
    bookList = _makeBook(widget.keyword, widget.selectedDiary.text);
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
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop(snapshot.data);
            });
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
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
                  top: 180,
                  left: MediaQuery.of(context).size.width / 2 - 146, // 가운데 정렬
                  child: Container(
                    width: 292,
                    height: 54,
                    padding: const EdgeInsets.only(left: 1.64, bottom: 0.30),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                      shadows: const [
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
                            color: const Color(0xFF0E0E0E),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 2, color: Color(0xFFFF2287)),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  '오늘의 일기 생성중',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                _ArrowRotationAnimation(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 160, // 텍스트 상자 위에 위치하도록 조정
                  left: MediaQuery.of(context).size.width / 2 - 200, // 가운데 정렬
                  child: CustomPaint(
                    size: const Size(400, 480),
                    painter: ShapePainter(),
                  ),
                ),
                Center(
                  child: _LoadingText(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        begin: const Alignment(0, -1.0), // 시작점을 위로 이동
        end: const Alignment(0, 1.0), // 끝점을 아래로 이동
        colors: [
          Colors.transparent,
          Colors.purple.withOpacity(0.5),
          Colors.transparent
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final Path path = Path()
      ..moveTo(size.width * 0.2, 0) // 왼쪽 위
      ..lineTo(size.width * 0.8, 0) // 오른쪽 위
      ..lineTo(size.width, size.height) // 오른쪽 아래
      ..lineTo(0, size.height) // 왼쪽 아래
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
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
  late Timer _timer;

  final List<String> _loadingTexts = [
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
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _index = (_index + 1) % _loadingTexts.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 71.0),
      child: Text(
        _loadingTexts[_index],
        style: const TextStyle(
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
