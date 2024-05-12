import 'package:flutter/material.dart';

// 상수 정의
const double cardBorderRadius = 15;
const Color cardBackgroundColor = Colors.black54;
const double smallPadding = 10;
const double largePadding = 20;

// 반응형 글꼴 크기 및 스타일 설정

double _tagFontSizeFactor(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth < 600) {
    return 0.01; // 작은 화면일 때 글꼴 크기 비율
  } else {
    return 0.015; // 큰 화면일 때 글꼴 크기 비율
  }
}

double _titleFontSizeFactor(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth < 600) {
    return 0.04; // 작은 화면일 때 글꼴 크기 비율
  } else {
    return 0.05; // 큰 화면일 때 글꼴 크기 비율
  }
}

double _descriptionFontSizeFactor(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth < 600) {
    return 0.025; // 작은 화면일 때 글꼴 크기 비율
  } else {
    return 0.03; // 큰 화면일 때 글꼴 크기 비율
  }
}

final TextStyle labelStyle = TextStyle(
  color: Colors.white,
  fontSize: 10,
  fontFamily: 'KoPubWorldDotum_Pro',
  fontWeight: FontWeight.w700,
);

TextStyle tagStyle(BuildContext context) => TextStyle(
      color: Colors.white,
      fontSize: MediaQuery.of(context).size.width * _tagFontSizeFactor(context),
      fontFamily: 'KoPubWorldDotum_Pro',
      fontWeight: FontWeight.w700,
      height: 1,
    );
TextStyle titleStyle(BuildContext context) => TextStyle(
      color: Colors.white,
      fontSize:
          MediaQuery.of(context).size.width * _titleFontSizeFactor(context),
      fontFamily: 'KoPubWorldDotum_Pro',
      fontWeight: FontWeight.w700,
      height: 1,
    );
TextStyle descriptionStyle(BuildContext context) => TextStyle(
      color: Colors.white,
      fontSize: MediaQuery.of(context).size.width *
          _descriptionFontSizeFactor(context),
      fontFamily: 'KoPubWorldDotum_Pro',
      fontWeight: FontWeight.w300,
      height: 1.5,
    );

// 공통 카드 레이아웃
Widget createCard({
  required String imageAsset,
  required String tagText,
  required String titleText,
  required String descriptionText,
  required VoidCallback onTap,
  Key? key,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double cardWidth = constraints.maxWidth;
      double cardHeight = constraints.maxHeight;

      return GestureDetector(
        onTap: onTap,
        child: Container(
          key: key,
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: cardBackgroundColor,
            borderRadius: BorderRadius.circular(cardBorderRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(cardBorderRadius),
                ),
                child: Image.asset(
                  imageAsset,
                  width: double.infinity,
                  height: cardHeight * 0.58,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(smallPadding, 0, smallPadding, 0),
                child: Text(
                  tagText,
                  style: tagStyle(context),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: smallPadding),
                child: Text(
                  titleText,
                  style: titleStyle(context),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    smallPadding, largePadding, smallPadding, 0),
                child: Text(
                  descriptionText,
                  style: descriptionStyle(context),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// 각 캐릭터 클래스
class CustomCard_myao extends StatelessWidget {
  final VoidCallback onTap;
  const CustomCard_myao({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createCard(
      imageAsset: 'assets/images/Myao_mao.png',
      tagText: '고양이',
      titleText: '먀오마아의 은밀한 취미생활',
      descriptionText:
          '"먀오마아"는 주인의 일기를 훔쳐보는 고양이이다. 먀오마아는 퉁명스럽고 귀찮음이 많지만 주인이 잠든 새벽에 주인의 일기를 보며 주인을 관찰하는 것이 취미이다.',
      onTap: onTap,
      key: key,
    );
  }
}

class CustomCard_mmung extends StatelessWidget {
  final VoidCallback onTap;
  const CustomCard_mmung({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createCard(
      imageAsset: 'assets/images/kimmung_2.png',
      tagText: '대학생',
      titleText: '우리도 모르는 우리들의 별빛',
      descriptionText:
          '김뭉은 평범한 대학생이다. 사람은 저마다의 빛을 가지고 있다. 다만 모든 이들이 깨닫지 못한다. 김뭉은 한 사람의 인생 스토리가 담긴 소설책을 읽으며 주인공의 빛을 발견한다.',
      onTap: onTap,
      key: key,
    );
  }
}

class CustomCard_yang extends StatelessWidget {
  final VoidCallback onTap;
  const CustomCard_yang({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createCard(
      imageAsset: 'assets/images/Yangkee_2.png',
      tagText: '양아치',
      titleText: '귀여운 것은 곧 사랑이다',
      descriptionText:
          '손뜨개를 좋아하는 양키. 아무도 자신이 손뜨개질을 좋아하는지 모른다. 같이 손뜨개질을 하는 친구 빼고.',
      onTap: onTap,
      key: key,
    );
  }
}
