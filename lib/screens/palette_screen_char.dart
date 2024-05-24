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
  required VoidCallback onCharacterSelected,
  required String buttonImageAsset,
  required bool isSelected,
  Key? key,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double cardWidth = constraints.maxWidth;
      double cardHeight = constraints.maxHeight;

      return GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
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
                    padding:
                        EdgeInsets.fromLTRB(smallPadding, 0, smallPadding, 0),
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
                      smallPadding,
                      largePadding,
                      smallPadding,
                      0,
                    ),
                    child: Text(
                      descriptionText,
                      style: descriptionStyle(context),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: smallPadding,
              right: smallPadding,
              child: GestureDetector(
                onTap: onCharacterSelected,
                child: Image.asset(
                  buttonImageAsset,
                  width: 32,
                  height: 32,
                  color: isSelected ? Colors.white : null, // 선택 상태에 따라 색상 변경
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

// 각 캐릭터 클래스
class CustomCard_myao extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onCharacterSelected;
  final String imageAsset;
  final String tagText;
  final String titleText;
  final String descriptionText;
  final String buttonImageAsset;

  // 기본값 설정
  const CustomCard_myao({
    super.key,
    required this.onTap,
    required this.onCharacterSelected,
    this.imageAsset = 'assets/images/Myao_mao.png',
    this.tagText = '고양이',
    this.titleText = '먀오마아의 은밀한 취미생활',
    this.descriptionText =
        '"먀오마아"는 주인의 일기를 훔쳐보는 고양이이다. 먀오마아는 퉁명스럽고 귀찮음이 많지만 주인이 잠든 새벽에 주인의 일기를 보며 주인을 관찰하는 것이 취미이다.',
    this.buttonImageAsset = 'assets/images/P_select0_ic.png',
  });

  @override
  State<CustomCard_myao> createState() => _CustomCard_myaoState();
}

class _CustomCard_myaoState extends State<CustomCard_myao> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return createCard(
      imageAsset: widget.imageAsset,
      tagText: widget.tagText,
      titleText: widget.titleText,
      descriptionText: widget.descriptionText,
      onTap: widget.onTap,
      onCharacterSelected: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onCharacterSelected();
      },
      buttonImageAsset: widget.buttonImageAsset,
      isSelected: _isSelected,
    );
  }
}

class CustomCard_mmung extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onCharacterSelected;
  final String imageAsset;
  final String tagText;
  final String titleText;
  final String descriptionText;
  final String buttonImageAsset;

  // 기본값 설정
  const CustomCard_mmung({
    required this.onTap,
    required this.onCharacterSelected,
    this.imageAsset = 'assets/images/kimmung_2.png',
    this.tagText = '고양이',
    this.titleText = '먀오마아의 은밀한 취미생활',
    this.descriptionText =
        '"먀오마아"는 주인의 일기를 훔쳐보는 고양이이다. 먀오마아는 퉁명스럽고 귀찮음이 많지만 주인이 잠든 새벽에 주인의 일기를 보며 주인을 관찰하는 것이 취미이다.',
    this.buttonImageAsset = 'assets/images/P_select0_ic.png',
  });

  @override
  _CustomCard_mmungState createState() => _CustomCard_mmungState();
}

class _CustomCard_mmungState extends State<CustomCard_mmung> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return createCard(
      imageAsset: widget.imageAsset,
      tagText: widget.tagText,
      titleText: widget.titleText,
      descriptionText: widget.descriptionText,
      onTap: widget.onTap,
      onCharacterSelected: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onCharacterSelected();
      },
      buttonImageAsset: widget.buttonImageAsset,
      isSelected: _isSelected,
    );
  }
}

class CustomCard_yang extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onCharacterSelected;
  final String imageAsset;
  final String tagText;
  final String titleText;
  final String descriptionText;
  final String buttonImageAsset;

  // 기본값 설정
  const CustomCard_yang({
    required this.onTap,
    required this.onCharacterSelected,
    this.imageAsset = 'assets/images/Yangkee_2.png',
    this.tagText = '고양이',
    this.titleText = '먀오마아의 은밀한 취미생활',
    this.descriptionText =
        '"먀오마아"는 주인의 일기를 훔쳐보는 고양이이다. 먀오마아는 퉁명스럽고 귀찮음이 많지만 주인이 잠든 새벽에 주인의 일기를 보며 주인을 관찰하는 것이 취미이다.',
    this.buttonImageAsset = 'assets/images/P_select0_ic.png',
  });

  @override
  _CustomCard_yangState createState() => _CustomCard_yangState();
}

class _CustomCard_yangState extends State<CustomCard_yang> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return createCard(
      imageAsset: widget.imageAsset,
      tagText: widget.tagText,
      titleText: widget.titleText,
      descriptionText: widget.descriptionText,
      onTap: widget.onTap,
      onCharacterSelected: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onCharacterSelected();
      },
      buttonImageAsset: widget.buttonImageAsset,
      isSelected: _isSelected,
    );
  }
}
