import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:capstone/models/book.dart';

class BookNotifier extends StateNotifier<List<Book>> {
  BookNotifier()
      : super([
          Book(
              url: 'https://picsum.photos/250?image=9',
              date: DateTime.timestamp(),
              title: '반 고흐의 감성',
              text: '...'),
          Book(
              url: 'https://picsum.photos/250?image=9',
              date: DateTime.timestamp(),
              title: '우리들은 기적으로 되어있다',
              text: '''오늘은 맑은 가을 날씨였다. 
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. 
          나는 조금 더 잠을 자고 싶었지만, 새소리가 너무 시끄러워서 일어나기로 했다.
          침대에서 나와 커튼을 열고 창문을 열었다. 시원한 가을 바람이 내 얼굴을 스쳤다.
          나는 깊에 한숨을 들이쉬며 오늘 하루를 시작할 준비를 했다. \n\n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n
          따뜻한 햇살이 창밖으로 들어와 내 방을 밝게 비추었다. \n\n\n\n\n\n
          
          아침 식사를 하고 난 후, 나는 학교에 가기 위해 집을 나섰다.
          학교까지 가는 길은 단풍잎으로 가득..'''),
        ]);

  void addBook(String text, String url, DateTime date, String title) {
    {
      state = [Book(date: date, text: text, url: url, title: title), ...state];
    }
  }
}

final bookProvider = StateNotifierProvider<BookNotifier, List<Book>>((ref) {
  return BookNotifier();
});
