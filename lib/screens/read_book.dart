import 'package:flutter/material.dart';
import 'package:capstone/models/book.dart';
import 'package:capstone/widgets/photo_hero.dart';

class ReadBookScreen extends StatelessWidget{
  const ReadBookScreen({super.key,required this.book});

  final Book book;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Books')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
             Navigator.pop(context);
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: 400,
              child: PhotoHero(
                photo: book.url,
                width: 300,
                height: 400,
                borderRadius: 20,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(
                book.text,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}