import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:capstone/screens/tab.dart';
import 'package:capstone/env.dart';
import 'package:dart_openai/dart_openai.dart';



final theme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor:
      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
  ),
  cardTheme: const CardTheme().copyWith(
    color: const Color.fromARGB(1, 255, 255, 255),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);




void main() async{
  /*
  OpenAI.apiKey = Env.apiKey;
  final systemMessage = OpenAIChatCompletionChoiceMessageModel(
  content: [
    OpenAIChatCompletionChoiceMessageContentItemModel.text(
      "return any message you are given as JSON.",
    ),
  ],
  role: OpenAIChatMessageRole.assistant,
);

  // the user message that will be sent to the request.
 final userMessage = OpenAIChatCompletionChoiceMessageModel(
   content: [
     OpenAIChatCompletionChoiceMessageContentItemModel.text(
       "Hello, I am a chatbot created by OpenAI. How are you today?",
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
OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
  model: "gpt-3.5-turbo-1106",
  responseFormat: {"type": "json_object"},
  seed: 6,
  messages: requestMessages,
  temperature: 0.2,
  maxTokens: 500,
);

print(chatCompletion.choices.first.message); 
*/



  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TapScreen(),
    );
  }
}
