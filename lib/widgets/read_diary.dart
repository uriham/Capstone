import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({super.key,required this.todayDairy});

  final Diary todayDairy;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 92, 148, 207),
      ),
      home: Scaffold(
        appBar: AppBar(
         
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // 뒤로 가기 버튼을 눌렀을 때 수행할 동작을 여기에 추가하세요.
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(children: [
            const SizedBox(height: 100,),
            Text(todayDairy.formattedDate,style: const TextStyle(fontSize: 30,),textAlign: TextAlign.center,),
            Text(todayDairy.text),
          ]),
        ),
      ),
    );
  }
}

