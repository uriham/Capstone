import 'package:flutter/material.dart';
import 'package:capstone/env.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:capstone/data/prompts.dart';

class BookCoverComplete extends StatefulWidget{
  const BookCoverComplete({super.key,required this.keyword});

  final keyword;

  @override
  State<BookCoverComplete> createState() {
    return _BookCoverScreenState();
  }
}
  
class _BookCoverScreenState extends State<BookCoverComplete>{

  late Future<String> bookurl;

  Future<String> _coverImageUrl(String input) async {
    final openaiApiKey = Env.apiKey;

    final llm = ChatOpenAI(
      apiKey: openaiApiKey,
      defaultOptions: const ChatOpenAIOptions(
        model: 'gpt-4-turbo-preview',
        temperature: 0,
      ),
    );

    final template = exSysmessage;
    final systemMessagePrompt =
        SystemChatMessagePromptTemplate.fromTemplate(template);
    const humanTemplate = '{text}';
    final humanMessagePrompt =
        HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);
    final chatPrompt = ChatPromptTemplate.fromPromptMessages(
        [systemMessagePrompt, humanMessagePrompt]);

    final tools = <BaseTool>[
      OpenAIDallETool(
        apiKey: openaiApiKey,
      ),
    ];
    final agent = OpenAIFunctionsAgent.fromLLMAndTools(
        llm: llm, tools: tools, systemChatMessage: systemMessagePrompt);
    final executor = AgentExecutor(agent: agent);
    final res = await executor.run(input);
    print(res.toString());
    return res;
  }

  Future<String> _makeBook(String question) async {
    final openaiApiKey = Env.apiKey;
    const template = 'make a story funny';
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

    final res = await chain.invoke({'text': question});
    return res.toString();
  }

  @override
  void initState() {
    super.initState();
    bookurl = _coverImageUrl(widget.keyword);
  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: bookurl, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.connectionState==ConnectionState.done) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Image.network(snapshot.data!),
                //child: Text('Result: ${snapshot.data}'),
              
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
