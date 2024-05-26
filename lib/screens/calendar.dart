import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:capstone/screens/diary_page.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime selectedDate = DateTime.now();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDate = selectedDay;
    });

    Navigator.of(context).pop(selectedDate); // 날짜 선택 후 선택된 날짜 반환
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5, // 화면의 절반을 차지하도록 설정
      alignment: Alignment.topCenter, // 화면 상단에 맞추도록 정렬
      child: Container(
        color: Colors.black, // 달력 배경색을 검은색으로 설정
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: DateTime.now(),
            selectedDayPredicate: (day) => isSameDay(selectedDate, day),
            onDaySelected: _onDaySelected,
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              outsideDaysVisible: false, // 달력 외부 날짜 숨기기
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false, // Format 버튼 숨기기
              titleCentered: true, // 제목 가운데 정렬
              titleTextStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              weekdayStyle: TextStyle(
                color: Colors.white, // 주중 날짜 텍스트 색상을 흰색으로 변경
                fontWeight: FontWeight.bold,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              // 주말 숫자 텍스트 색상을 빨간색으로 지정
              defaultBuilder: (context, date, _) {
                final isWeekend = date.weekday == DateTime.saturday ||
                    date.weekday == DateTime.sunday;
                final textStyle = TextStyle(
                  color: isWeekend ? Colors.red : Colors.white,
                  fontWeight: FontWeight.bold,
                );
                return Center(
                  child: Text(
                    '${date.day}',
                    style: textStyle,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
