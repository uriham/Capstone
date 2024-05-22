import 'package:flutter/material.dart';
import 'package:prism_test/models/diary.dart';
import 'package:prism_test/models/diary_provider.dart';
import 'package:prism_test/screens/diary_edit.dart';
import 'package:provider/provider.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    Color backgroundColor =
        now.hour >= 6 && now.hour < 19 ? Colors.white : Colors.black;
    Color textColor =
        now.hour >= 6 && now.hour < 19 ? Colors.black : Colors.white;

    final diaryProvider = Provider.of<DiaryProvider>(context);
    Diary? todayDiary = diaryProvider.getTodayDiary();

    final TextEditingController _controller = TextEditingController();
    if (todayDiary != null) {
      _controller.text = todayDiary.text;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('yyyy-MM-dd').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 16.0),
              if (todayDiary == null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Write today\'s diary...',
                        labelStyle: TextStyle(color: textColor),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        diaryProvider.addDiary(context, _controller.text);
                        _controller.clear();
                        todayDiary = diaryProvider.getTodayDiary();
                      },
                      child: Text(
                        'Save Diary',
                        style: TextStyle(color: textColor),
                      ),
                    ),
                  ],
                ),
              if (todayDiary != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Today\'s Diary:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        todayDiary!.text,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditDiaryScreen(diary: todayDiary!)),
                        );
                      },
                      child: Text(
                        'Edit Diary',
                        style: TextStyle(color: textColor),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => DiaryScreen()),
                  // );
                },
                child: Text(
                  'See All Diaries',
                  style: TextStyle(color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
