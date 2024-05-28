import 'package:flutter/material.dart';

const double cardBorderRadius = 15;
const Color cardBackgroundColor = Colors.black54;
const double smallPadding = 15;
const double largePadding = 20;

// 고정된 글꼴 크기 및 스타일 설정
const double tagFontSize = 12;
const double titleFontSize = 24;
const double descriptionFontSize = 14;

final TextStyle labelStyle = TextStyle(
  color: Colors.white,
  fontSize: 10,
  fontFamily: 'KoPubWorldDotum_Pro',
  fontWeight: FontWeight.w700,
);

TextStyle tagStyle(BuildContext context) => TextStyle(
      color: Colors.white,
      fontSize: tagFontSize,
      fontFamily: 'KoPubWorldDotum_Pro',
      fontWeight: FontWeight.w700,
      height: 1,
    );

TextStyle titleStyle(BuildContext context) => TextStyle(
      color: Colors.white,
      fontSize: titleFontSize,
      fontFamily: 'KoPubWorldDotum_Pro',
      fontWeight: FontWeight.w700,
      height: 1,
    );

TextStyle descriptionStyle(BuildContext context) => TextStyle(
      color: Colors.white,
      fontSize: descriptionFontSize,
      fontFamily: 'KoPubWorldDotum_Pro',
      fontWeight: FontWeight.w300,
      height: 1.5,
    );

// 공통 카드 레이아웃
Widget createCard({
  required BuildContext context,
  required String imageAsset,
  required String tagText,
  required String titleText,
  required String descriptionText,
  required VoidCallback onTap,
  required VoidCallback onCharacterSelected,
  required String buttonImageAsset,
  required bool isSelected,
  required double cardWidth, // cardWidth 매개변수 추가
  required double cardHeight, // cardHeight 매개변수 추가
  Key? key,
}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Stack(
        children: [
          Container(
            key: key,
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
                  child: Stack(
                    children: [
                      Image.asset(
                        imageAsset,
                        width: cardWidth,
                        height: cardHeight * 0.48, // 카드 높이의 48%
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        left: 17, // 텍스트의 왼쪽 여백
                        bottom: 10, // 텍스트의 아래쪽 여백
                        child: Text(
                          tagText,
                          style: tagStyle(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
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
                width: 36,
                height: 36,
                color: isSelected ? Colors.white : null, // 선택 상태에 따라 색상 변경
              ),
            ),
          ),
        ],
      ),
    ),
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
      context: context, // BuildContext 전달
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
      cardWidth: 380.0, // 여기서 사진의 너비를 설정
      cardHeight: 657.0, // 사진의 높이를 설정
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
    this.tagText = '대학생',
    this.titleText = '우리도 모르는 우리들의 별빛',
    this.descriptionText =
        ' 김뭉은 평범한 대학생이다. 사람은 저마다의 빛을 가지고 있다. 다만 모든 이들이 깨닫지 못한다. 김뭉은 한 사람의 인생 스토리가 닮긴 소설책을 읽으며, 주인공의 빛을 발견한다. 사람들의 심리를 이해하고 관찰하며 자신 또한 그들로 인해 깨닮음을 얻고자한다.',
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
      context: context, // BuildContext 전달

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
      cardWidth: 380.0, // 여기서 카드의 너비를 설정
      cardHeight: 657.0, // 카드의 높이를 설정
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
    this.tagText = '양아치',
    this.titleText = '귀여운 것은 곧 사랑이다',
    this.descriptionText =
        '손뜨개를 좋아하는 양키. 아무도 자신이 손뜨개질을 좋아하는 지 모른다. 같이 손뜨개질을 하는 친구 빼고. 입이 험하고 행동이 거칠지만 귀여운 것을 좋아하는 순수한 소년이다. 친구에게 거칠게 입막음을 하지만 친구의 이야기를 잘 들어주며 그의 단순한 생각회로로 도움을 줄 때도 있다 ',
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
      context: context, // BuildContext 전달

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
      cardWidth: 380.0, // 여기서 카드의 너비를 설정
      cardHeight: 657.0, // 카드의 높이를 설정
    );
  }
}

class CustomCard_pooh extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onCharacterSelected;
  final String imageAsset;
  final String tagText;
  final String titleText;
  final String descriptionText;
  final String buttonImageAsset;

  // 기본값 설정
  const CustomCard_pooh({
    required this.onTap,
    required this.onCharacterSelected,
    this.imageAsset = 'assets/images/Winne the pooh2.png',
    this.tagText = '푸',
    this.titleText = 'Winne the Pooh',
    this.descriptionText =
        '위니 더 푸는 동글동글한 얼굴과 큰 눈, 작은 코, 짧은 다리 등 귀여운 외모를 가지고 있으며 항상 밝고 긍정적인 성격을 가지고 있다. 친구들과 함께 노는 것을 좋아하며, 당신은 위니 더 푸와 함께 동화 속에서 한 장의 페이지를 기록하게 됩니다.',
    this.buttonImageAsset = 'assets/images/P_select0_ic.png',
  });

  @override
  _CustomCard_poohState createState() => _CustomCard_poohState();
}

class _CustomCard_poohState extends State<CustomCard_pooh> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return createCard(
      context: context, // BuildContext 전달

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
      cardWidth: 380.0, // 여기서 카드의 너비를 설정
      cardHeight: 657.0, // 카드의 높이를 설정
    );
  }
}

class CustomCard_Thoreau extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onCharacterSelected;
  final String imageAsset;
  final String tagText;
  final String titleText;
  final String descriptionText;
  final String buttonImageAsset;

  // 기본값 설정
  const CustomCard_Thoreau({
    required this.onTap,
    required this.onCharacterSelected,
    this.imageAsset = 'assets/images/Thoreau2.png',
    this.tagText = '철학자',
    this.titleText = '숲 속을 거닐다 ',
    this.descriptionText =
        '헨리 데이비드 소로는 미국의 사상가이자 문학가이며, 자연주의 철학자이다. 대자연 속에서 간단하고 순수한 삶을 추구하며, 독립적인 생활과 개인의 내적 탐구에 대한 중요성을 강조한다. 라디오 디제이로서 소로가 여러분들의 이야기를 들어드립니다. 많은 관심 부탁드려요.',
    this.buttonImageAsset = 'assets/images/P_select0_ic.png',
  });

  @override
  _CustomCard_ThoreauState createState() => _CustomCard_ThoreauState();
}

class _CustomCard_ThoreauState extends State<CustomCard_Thoreau> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return createCard(
      context: context, // BuildContext 전달

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
      cardWidth: 380.0, // 여기서 카드의 너비를 설정
      cardHeight: 657.0, // 카드의 높이를 설정
    );
  }
}

class CustomCard_leesangv2 extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onCharacterSelected;
  final String imageAsset;
  final String tagText;
  final String titleText;
  final String descriptionText;
  final String buttonImageAsset;

  // 기본값 설정
  const CustomCard_leesangv2({
    required this.onTap,
    required this.onCharacterSelected,
    this.imageAsset = 'assets/images/leesangv2_2.png',
    this.tagText = '한국 시인',
    this.titleText = '동생 보아라',
    this.descriptionText =
        '이상(李箱)은 일제강점기 시대의 대표적인 시인이자 소설가이다. 자의식과 내면 세계를 탐구하며 틀에 박히지 않은 시로 현대시의 새로운 지평을 열었다. 성격과 행동이 워낙 남달랐지만 동생을 아끼는 애틋한 마음을 편지에 담아 전달한다. ',
    this.buttonImageAsset = 'assets/images/P_select0_ic.png',
  });

  @override
  _CustomCard_leesangv2State createState() => _CustomCard_leesangv2State();
}

class _CustomCard_leesangv2State extends State<CustomCard_leesangv2> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return createCard(
      context: context, // BuildContext 전달

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
      cardWidth: 380.0, // 여기서 카드의 너비를 설정
      cardHeight: 657.0, // 카드의 높이를 설정
    );
  }
}

class CustomCard_alsoubet extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onCharacterSelected;
  final String imageAsset;
  final String tagText;
  final String titleText;
  final String descriptionText;
  final String buttonImageAsset;

  // 기본값 설정
  const CustomCard_alsoubet({
    required this.onTap,
    required this.onCharacterSelected,
    this.imageAsset = 'assets/images/alsoubet and igo2.png',
    this.tagText = '인물',
    this.titleText = '그리스 앞바다',
    this.descriptionText =
        '알소베는 현재의 욕망에 몰입하며, 사회적 윤리와 운명적인 모순에 직면하면서도 치열한 삶을 살고자 하며, 이고는 자유와 순수함, 열정과 뜨거움을 가진 인물로 인간의 본연의 아름다움과 열정을 드러낸다. 이들은 어느 날부터 떠내려오는 맥주 명 속 편지를 발견하곤 편지 속 주인공을 궁금해 하기 시작한다.',
    this.buttonImageAsset = 'assets/images/P_select0_ic.png',
  });

  @override
  _CustomCard_alsoubetState createState() => _CustomCard_alsoubetState();
}

class _CustomCard_alsoubetState extends State<CustomCard_alsoubet> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return createCard(
      context: context, // BuildContext 전달

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
      cardWidth: 380.0, // 여기서 카드의 너비를 설정
      cardHeight: 657.0, // 카드의 높이를 설정
    );
  }
}

class CustomCard_dongja extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onCharacterSelected;
  final String imageAsset;
  final String tagText;
  final String titleText;
  final String descriptionText;
  final String buttonImageAsset;

  // 기본값 설정
  const CustomCard_dongja({
    required this.onTap,
    required this.onCharacterSelected,
    this.imageAsset = 'assets/images/dongja2.png',
    this.tagText = '동자승',
    this.titleText = '동자청풍',
    this.descriptionText =
        '이레는 호기심 많고 사랑스러운 7살 동자승이다. 매일 아침 일찍 일어나 큰절을 올리며 하루를 시작한다. 순수한 마음을 가지고 있어 세상 모든 것에 호기심이 많고 다른 사람들과 나누는 것을 좋아한다. 절에 오는 손님들에게 먼저 다가가 밝게 인사하며 스님에게 배운 것들을 전달하며 같이 놀고자 한다.',
    this.buttonImageAsset = 'assets/images/P_select0_ic.png',
  });

  @override
  _CustomCard_dongjaState createState() => _CustomCard_dongjaState();
}

class _CustomCard_dongjaState extends State<CustomCard_dongja> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return createCard(
      context: context, // BuildContext 전달

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
      cardWidth: 380.0, // 여기서 카드의 너비를 설정
      cardHeight: 657.0, // 카드의 높이를 설정
    );
  }
}

class CustomCard_jang extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onCharacterSelected;
  final String imageAsset;
  final String tagText;
  final String titleText;
  final String descriptionText;
  final String buttonImageAsset;

  // 기본값 설정
  const CustomCard_jang({
    required this.onTap,
    required this.onCharacterSelected,
    this.imageAsset = 'assets/images/jang2.png',
    this.tagText = '장승',
    this.titleText = '풍하마을 수호 장승',
    this.descriptionText =
        '풍하 마을을 수호하는 천하대장군과 지하여장군, 지나가려는 나그네는 이들에게 자신은 심신이 투명한 자인 것을 증명해야 한다. 장승들은 나그네의 삶을 듣고 이 사람이 어떤 사람이고 어떤 생각으로 살아가고 있는 지 판단하여 입장을 허한다.',
    this.buttonImageAsset = 'assets/images/P_select0_ic.png',
  });

  @override
  _CustomCard_jangState createState() => _CustomCard_jangState();
}

class _CustomCard_jangState extends State<CustomCard_jang> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return createCard(
      context: context, // BuildContext 전달

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
      cardWidth: 380.0, // 여기서 카드의 너비를 설정
      cardHeight: 657.0, // 카드의 높이를 설정
    );
  }
}

class CustomCard_halmae extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onCharacterSelected;
  final String imageAsset;
  final String tagText;
  final String titleText;
  final String descriptionText;
  final String buttonImageAsset;

  // 기본값 설정
  const CustomCard_halmae({
    required this.onTap,
    required this.onCharacterSelected,
    this.imageAsset = 'assets/images/halmae2.png',
    this.tagText = '할머니',
    this.titleText = '우리 아가 왔나',
    this.descriptionText =
        '할머니의 댓가없는 사랑과 끝없는 지지를 주며 일상에서 겪는 어려움과 고민을 들어주고 위로와 격려를 건넨다. 자신의 가치를 깨닫고, 행복을 스스로 찾아갈 수 있도록 할머니의 정성과 관심을 전한다.',
    this.buttonImageAsset = 'assets/images/P_select0_ic.png',
  });

  @override
  _CustomCard_halmaeState createState() => _CustomCard_halmaeState();
}

class _CustomCard_halmaeState extends State<CustomCard_halmae> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return createCard(
      context: context, // BuildContext 전달

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
      cardWidth: 380.0, // 여기서 카드의 너비를 설정
      cardHeight: 657.0, // 카드의 높이를 설정
    );
  }
}

class CustomCard_yeonhwa extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onCharacterSelected;
  final String imageAsset;
  final String tagText;
  final String titleText;
  final String descriptionText;
  final String buttonImageAsset;

  // 기본값 설정
  const CustomCard_yeonhwa({
    required this.onTap,
    required this.onCharacterSelected,
    this.imageAsset = 'assets/images/yeonhwa2.png',
    this.tagText = '꽃집 사장',
    this.titleText = '심연의 화원',
    this.descriptionText =
        '연화는 동네에서 꽃집을 운영하며, 마음을 읽는 능력을 가지고 있다. 능력을 통해 동네 주민들의 고민과 걱정, 기분을 알아차리고 그들에게 도움이 될 수 있도록 꽃말과 같이 꽃을 추천해주며, 꽃의 언어로 위로와 격려를 전달한다. 연화는 그들의 마음을 위로하며 오늘의 꽃을 피워낸다.',
    this.buttonImageAsset = 'assets/images/P_select0_ic.png',
  });

  @override
  _CustomCard_yeonhwaState createState() => _CustomCard_yeonhwaState();
}

class _CustomCard_yeonhwaState extends State<CustomCard_yeonhwa> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return createCard(
      context: context, // BuildContext 전달

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
      cardWidth: 380.0, // 여기서 카드의 너비를 설정
      cardHeight: 657.0, // 카드의 높이를 설정
    );
  }
}
