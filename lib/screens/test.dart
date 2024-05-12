import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePicker> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll Date Picker Example"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 100.0,
            alignment: Alignment.center,
            child: Text(
              "$_selectedDate",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 48),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _selectedDate = DateTime.now();
                });
              },
              child: Text(
                "TODAY",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),

          // Showcase second image source
          SizedBox(
            width: 160,
            height: 113,
            child: ScrollDatePicker(
              selectedDate: _selectedDate,
              locale: Locale('ko'),
              scrollViewOptions: DatePickerScrollViewOptions(
                  year: ScrollViewDetailOptions(
                    //label: '년',
                    margin: const EdgeInsets.only(right: 8),
                  ),
                  month: ScrollViewDetailOptions(
                    //label: '월',
                    margin: const EdgeInsets.only(right: 8),
                  ),
                  day: ScrollViewDetailOptions(
                      //label: '일',
                      )),
              onDateTimeChanged: (DateTime value) {
                setState(() {
                  _selectedDate = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
