import 'package:capstone/models/diary.dart';
import 'package:flutter/material.dart';
import 'package:capstone/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:capstone/data/prompts.dart';
import 'package:capstone/providers/book_provider.dart';

class BookCoverComplete extends ConsumerStatefulWidget {
  const BookCoverComplete(
      {super.key,
      required this.title,
      required this.keyword,
      required this.todayDiary});

  final String title;
  final String keyword;
  final Diary todayDiary;

  @override
  BookCoverCompleteState createState() {
    return BookCoverCompleteState();
  }
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
        llm: llm, tools: tools, systemChatMessage: urlsystemMessagePrompt);
    const outputParser = StringOutputParser();

    final chain = bookchatPrompt | llm | outputParser;

    final executor = AgentExecutor(agent: agent);
    final url = await executor.run(keyword);
    final text = await chain.invoke({'text': content});
    print('url');
    
    return [url,text.toString()];
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
        defaultOptions: const ChatOpenAIOptions(model: 'gpt-4-turbo-preview'));
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
    //ref.read(bookProvider.notifier).addBook(bookText, bookUrl, widget.todayDiary.date, widget.title );

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<List<String>>(
        future: bookList, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          List<Widget> children;
          if (snapshot.connectionState == ConnectionState.done) {
            //String bookUrl = snapshot.data![0];
            //String bookText = snapshot.data![1];
            
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Image.network(snapshot.data![0]),
              Text(snapshot.data![1]),
              //child: Text('Result: ${snapshot.data}'),
            ];
            //ref.read(bookProvider.notifier).addBook(bookText, bookUrl, widget.todayDiary.date, widget.title);
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
            child: ListView(
              
              children: children,
            ),
          );
        },
      ),
    );
  }
}
