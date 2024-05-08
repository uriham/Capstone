import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 텍스트 스타일 정의
final textTitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 22,
  fontFamily: 'KoPubWorldDotum_Pro',
  fontWeight: FontWeight.w700,
);

final textSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 11,
  fontFamily: 'KoPubWorldDotum_Pro',
  fontWeight: FontWeight.w300,
);

final textSmallStyle = TextStyle(
  color: Colors.white,
  fontSize: 10,
  fontFamily: 'KoPubWorldDotum_Pro',
  fontWeight: FontWeight.w700,
);

final commonPadding = EdgeInsets.symmetric(horizontal: 10);
final commonPadding2 = EdgeInsets.fromLTRB(10, 20, 10, 0);

// 재사용 가능한 컴포넌트 정의
class TopImageSection extends StatelessWidget {
  final String imagePath;
  final VoidCallback onBackPress;

  const TopImageSection({
    required this.imagePath,
    required this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 318,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              icon: Image.asset(
                'assets/images/Pi_back_ic.png',
                width: 30,
                height: 30,
              ),
              onPressed: onBackPress,
            ),
          ),
        ],
      ),
    );
  }
}

class RelationImage extends StatelessWidget {
  final String imagePath;
  final String label;

  const RelationImage({
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ExampleSection extends StatelessWidget {
  final String title;
  final List<TextSpan> textSpans;

  const ExampleSection({
    required this.title,
    required this.textSpans,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'KoPubWorldDotum_Pro',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Container(
            width: 340,
            height: 187,
            color: Color(0xFF1A1A1A),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text.rich(
                TextSpan(
                  children: textSpans,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// 메인 스크린
class PaletteScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String category;
  final String tagLine;
  final String exampleTitle;
  final List<TextSpan> exampleTextSpans;
  final List<Widget> relationImages;

  const PaletteScreen({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.category,
    required this.tagLine,
    required this.exampleTitle,
    required this.exampleTextSpans,
    required this.relationImages,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TopImageSection(
              imagePath: imagePath,
              onBackPress: () => Navigator.pop(context),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: commonPadding,
                    child: Text(
                      category,
                      style: textSmallStyle,
                    ),
                  ),
                  Padding(
                    padding: commonPadding,
                    child: Text(
                      title,
                      style: textTitleStyle,
                    ),
                  ),
                  Padding(
                    padding: commonPadding,
                    child: Text(
                      tagLine,
                      style: textSubtitleStyle,
                    ),
                  ),
                  Padding(
                    padding: commonPadding2,
                    child: Text(
                      description,
                      style: textSubtitleStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      '관계',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'KoPubWorldDotum_Pro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: relationImages, // `relationImages` 값 사용
                    ),
                  ),
                  ExampleSection(
                    title: exampleTitle,
                    textSpans: exampleTextSpans,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class palette_screen_next_miao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/Myao_mao.png',
      title: '먀오마아의 은밀한 취미생활',
      category: '고양이',
      tagLine: '#고양이 #퉁명 #츤데레 #내편',
      description:
          '"먀오마아"는 주인의 일기를 훔쳐보는 고양이이다. 먀오마아는 퉁명스럽고 귀찮음이 많지만 주인이 잠든 새벽에 주인의 일기를 보며 주인을 관찰하는 것이 취미이다. 본능에 충실한 고양이로서, 인간들의 심리, 생각, 고정관념에 대해서 이해와 공감을 하지 못하지만 주인을 향한 애정은 확실하다.\n',
      exampleTitle: '예시',
      exampleTextSpans: [
        TextSpan(
          text:
              '"오후에는 도서관에서 공부를 했는데 취업 때문에 집중이 잘 되지 않았다. 나는 정말 이 길을 갈 수 있을까? 요즘 생각이 깊어진다.."\n\n',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
        TextSpan(
          text:
              '"주인이 도서관에서 공부를? 집에선 뒹굴뒹굴거리기에 밖에서 제대로 생활하나 했더니 나쁘지 않은 모양이군" 고양이는 속으로 중얼거렸다. "흐음. 어제도 일기에 취업 걱정을 주저리 써놨던데 취업인가 하는 놈이 속을 썩이나보군. 어떻게 생긴 놈인지 알면 앞발펀치를 날려줄텐데. 재수좋은 놈이로군! 그나저나 요새 밥도 잘 안 먹고, 무기력한거 보면 심히 걱정이란 말이지.."\n',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'KoPubWorldDotum_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/Myao-maa_profile.png',
          label: '먀오마아',
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: 'assets/images/R_Location_circle.png',
          label: '주인',
        ),
      ],
    );
  }
}

class palette_screen_next_mmung extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/kimmung_2.png',
      title: '먀오마아의 은밀한 취미생활',
      category: '대학생',
      description: '먀오마아는 주인의 일기를 훔쳐보는 고양이이다.', // 필수 매개변수 추가
      tagLine: '#고양이 #퉁명 #츤데레 #내편',
      exampleTitle: '예시',
      exampleTextSpans: [
        TextSpan(
          text:
              '"오후에는 도서관에서 공부를 했는데 취업 때문에 집중이 잘 되지 않았다. 나는 정말 이 길을 갈 수 있을까? 요즘 생각이 깊어진다.."\n\n',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
        TextSpan(
          text:
              '"주인이 도서관에서 공부를? 집에선 뒹굴뒹굴거리기에 밖에서 제대로 생활하나 했더니 나쁘지 않은 모양이군" 고양이는 속으로 중얼거렸다. "흐음. 어제도 일기에 취업 걱정을 주저리 써놨던데 취업인가 하는 놈이 속을 썩이나보군. 어떻게 생긴 놈인지 알면 앞발펀치를 날려줄텐데. 재수좋은 놈이로군! 그나저나 요새 밥도 잘 안 먹고, 무기력한거 보면 심히 걱정이란 말이지.."\n',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'KoPubWorldDotum_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/Myao-maa_profile.png',
          label: '먀오마아',
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
        ),
        RelationImage(
          imagePath: 'assets/images/R_Location_circle.png',
          label: '주인',
        ),
      ],
    );
  }
}

class palette_screen_next_yang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/Myao_mao.png',
      title: '먀오마아의 은밀한 취미생활',
      category: '양아치',
      description: '먀오마아는 주인의 일기를 훔쳐보는 고양이이다.', // 필수 매개변수 추가
      tagLine: '#고양이 #퉁명 #츤데레 #내편',
      exampleTitle: '예시',
      exampleTextSpans: [
        TextSpan(
          text:
              '"오후에는 도서관에서 공부를 했는데 취업 때문에 집중이 잘 되지 않았다. 나는 정말 이 길을 갈 수 있을까? 요즘 생각이 깊어진다.."\n\n',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
        TextSpan(
          text:
              '"주인이 도서관에서 공부를? 집에선 뒹굴뒹굴거리기에 밖에서 제대로 생활하나 했더니 나쁘지 않은 모양이군" 고양이는 속으로 중얼거렸다. "흐음. 어제도 일기에 취업 걱정을 주저리 써놨던데 취업인가 하는 놈이 속을 썩이나보군. 어떻게 생긴 놈인지 알면 앞발펀치를 날려줄텐데. 재수좋은 놈이로군! 그나저나 요새 밥도 잘 안 먹고, 무기력한거 보면 심히 걱정이란 말이지.."\n',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'KoPubWorldDotum_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/Myao-maa_profile.png',
          label: '먀오마아',
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
        ),
        RelationImage(
          imagePath: 'assets/images/R_Location_circle.png',
          label: '주인',
        ),
      ],
    );
  }
}
