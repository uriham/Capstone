import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoadingText extends StatefulWidget {
  const LoadingText({super.key});

  @override
  State<LoadingText> createState() => _LoadingTextState();
}

class _LoadingTextState extends State<LoadingText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30.0,
          fontFamily: 'Agne',
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText('마오먀아는 봄베이라는 고양이 품종입니다.',
                duration: const Duration(seconds: 5)),
            FadeAnimatedText(
              '본 Dizrizm은 약 3개월만에 제작되었습니다.',
              duration: const Duration(seconds: 5),
            ),
            FadeAnimatedText(
              '이상의 이름은 조선총독부에서 건축기사로 일했을 당시 인부가 그의 성을 김씨가 아닌 이씨로 착각하여 이상이라고 불렸다는 설이 있습니다.',
              duration: const Duration(seconds: 5),
            ),
            FadeAnimatedText(
              '밤에 늦게 자면 배고픈 이유는 그렘린이라는 호르몬 때문입니다.',
              duration: const Duration(seconds: 5),
            ),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
}
