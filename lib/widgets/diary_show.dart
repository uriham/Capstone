import 'package:flutter/material.dart';
import 'package:capstone/models/diary.dart';

class DiaryShow extends StatelessWidget {
  const DiaryShow({super.key, required this.todayDiary});

  final Diary todayDiary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(15),
        //     border: Border.all(color: Colors.white)),
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.left,
              todayDiary.getDayofMonth(),
              style: const TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              todayDiary.text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            // Image.asset(
            //   'assets/images/StarryNight.jpg',
            //   height: 400,
            // ),
            // const SizedBox(
            //   height: 16,
            // ),
            // Row(
            //   children: [
            //     // Text(
            //     //   todayDiary.formattedDate,
            //     //   style: const TextStyle(
            //     //     fontSize: 20,
            //     //   ),
            //     // ),
            //     const SizedBox(
            //       width: 30,
            //     ),
            //     Container(
            //         width: 200,
            //         child: const Divider(
            //             color: Color.fromARGB(255, 240, 226, 225),
            //             thickness: 2.0)),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
