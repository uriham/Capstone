import 'package:capstone/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MybookScreen extends ConsumerWidget {
  const MybookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayDiary = ref.watch(bookProvider);
    final bookList = ref.watch(bookProvider);
    Widget content = const Text(
      'oh there is not book here',
      style: TextStyle(color: Colors.white),
    );

    if (todayDiary.isNotEmpty) {
      content = Column(children: [
        Text(bookList[0].text,
            style: const TextStyle(
              color: Colors.white,
            )),
        Image.network(bookList[0].url)
      ]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 80), // 위쪽 여백 추가
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(80, 0, 80, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white),
            ),
            child: InkWell(
              onTap: () {},
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //     border: Border.all(color: Colors.white)),
                    child: Column(
                      children: [
                        content,
                      ],
                    ),
                  ),
                ), //여기 바꿔야함
              ),
            ),
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}
