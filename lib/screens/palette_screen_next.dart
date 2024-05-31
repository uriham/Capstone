import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 텍스트 스타일 정의
final textTitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 26,
  fontFamily: 'KoPubWorldDotum_Pro',
  fontWeight: FontWeight.w700,
);

final textSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 13,
  fontFamily: 'KoPubWorldDotum_Pro',
  fontWeight: FontWeight.w300,
);

final textSmallStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontFamily: 'KoPubWorldDotum_Pro',
  fontWeight: FontWeight.w700,
);

final commonPadding = EdgeInsets.symmetric(horizontal: 8);
final commonPadding2 = EdgeInsets.fromLTRB(10, 10, 10, 0);

// 재사용 가능한 컴포넌트 정의
class TopImageSection extends StatelessWidget {
  final String imagePath;
  final String category; // category 추가
  final VoidCallback onBackPress;

  const TopImageSection({
    required this.imagePath,
    required this.category, // category 추가
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
                width: 45,
                height: 45,
              ),
              onPressed: onBackPress,
            ),
          ),
          Positioned(
            left: 13,
            bottom: 3,
            child: Text(
              category,
              style: textSmallStyle,
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
  final double width;
  final double height;

  const RelationImage({
    required this.imagePath,
    required this.label,
    this.width = 100.0, // 기본값 설정
    this.height = 100.0, // 기본값 설정
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
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
            fontFamily: 'KoPubWorldDotum_Pro',
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
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'KoPubWorldDotum_Pro',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Container(
            width: 340,
            height: 200,
            color: Color(0xFF1A1A1A),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text.rich(
                TextSpan(
                  children: textSpans,
                ),
                textAlign: TextAlign.start,
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
  final String selectedImage;
  final List<TextSpan> exampleTextSpans;
  final List<Widget> relationImages;

  const PaletteScreen(
      {required this.imagePath,
      required this.title,
      required this.description,
      required this.category,
      required this.tagLine,
      required this.exampleTitle,
      required this.exampleTextSpans,
      required this.relationImages,
      required this.selectedImage
      // 추가: 선택한 이미지 경로

      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TopImageSection(
                  imagePath: imagePath,
                  category: category, // category 전달
                  onBackPress: () => Navigator.pop(context),
                ),
                Padding(
                  padding: commonPadding,
                  child: Text(
                    title,
                    style: textTitleStyle,
                  ),
                ),
                SizedBox(
                  height: 1,
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
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    '관계',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'KoPubWorldDotum_Pro',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
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
        ),
      ),
    );
  }
}

class palette_screen_next_miao extends StatelessWidget {
  final String selectedImage;

  const palette_screen_next_miao({
    required this.selectedImage,
  });
  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/Myao_mao.png',
      title: '먀오마아의 은밀한 취미생활',
      category: '고양이',
      selectedImage: 'selectedImage',
      tagLine: '#고양이 ' ' ' ' #퉁명 ' ' ' ' #츤데레 ' ' ' ' #내편',
      description:
          '"먀오마아"는 주인의 일기를 훔쳐보는 고양이이다. 먀오마아는 퉁명스럽고 귀찮음이 많지만 주인이 잠든 새벽에 주인의 일기를 보며 주인을 관찰하는 것이 취미이다. 본능에 충실한 고양이로서, 인간들의 심리, 생각, 고정관념에 대해서 이해와 공감을 하지 못하지만 주인을 향한 애정은 확실하다.\n',
      exampleTitle: '예시',
      exampleTextSpans: [
        TextSpan(
          text:
              '““오후에는 도서관에서 공부를 했는데 취업 때문에 집중이 잘 되지 않았다. 나는 정말 이 길을 갈 수 있을까? 요즘 생각이 깊어진다..””\n\n\n"주인이 도서관에서 공부를? 집에선 뒹굴뒹굴거리기에 밖에서 제대로 생활하나 했더니 나쁘지 않은 모양이군" 고양이는 속으로 중얼거렸다. "흐음. 어제도 일기에 취업 걱정을 주저리 써놨던데 취업인가 하는 놈이 속을 썩이나보군. 어떻게 생긴 놈인지 알면 앞발펀치를 날려줄텐데. 재수좋은 놈이로군! ...',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
            height: 0,
          ),
        ),

        // TextSpan(
        //   text:
        //       '"주인이 도서관에서 공부를? 집에선 뒹굴뒹굴거리기에 밖에서 제대로 생활하나 했더니 나쁘지 않은 모양이군" 고양이는 속으로 중얼거렸다. "흐음. 어제도 일기에 취업 걱정을 주저리 써놨던데 취업인가 하는 놈이 속을 썩이나보군. 어떻게 생긴 놈인지 알면 앞발펀치를 날려줄텐데. 재수좋은 놈이로군! 그나저나 요새 밥도 잘 안 먹고, 무기력한거 보면 심히 걱정이란 말이지.."\n',
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontSize: 11,
        //     fontFamily: 'KoPubWorldDotum_Pro',
        //     fontWeight: FontWeight.w300,
        //   ),
        // ),
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
          width: 60.0, // 원하는 크기로 설정
          height: 60.0,
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: selectedImage,
          label: '주인',
        ),
      ],
    );
  }
}

class palette_screen_next_mmung extends StatelessWidget {
  final String selectedImage;
  const palette_screen_next_mmung({
    required this.selectedImage,
  });

  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/kimmung_2.png',
      title: '우리도 모르는 우리들의 별빛',
      category: '대학생',
      tagLine: '#대학생 ' ' ' ' #심리 ' ' ' ' #배움 ' ' ' ' #깨달음',
      selectedImage: 'selectedImage',
      description:
          ' 김뭉은 평범한 대학생이다. 사람은 저마다의 빛을 가지고 있다. 다만 모든 이들이 깨닫지 못한다. 김뭉은 한 사람의 인생 스토리가 닮긴 소설책을 읽으며, 주인공의 빛을 발견한다. 사람들의 심리를 이해하고 관찰하며 자신 또한 그들로 인해 깨달음을 얻고자한다.\n',
      exampleTitle: '예시',
      exampleTextSpans: [
        TextSpan(
          text:
              '"초봄이라 날씨가 쌀쌀했다. 한숨을 쉬니 하얗게 올라오는 입김들을 보니 조금은 머리가 차분해 지는 기분이었다."\n\n늘 이맘때 쯤이면 소설 한 권을 들고 조용한 공원을 찾곤 한다. 그곳에서 다른 사람들의 이야기를 읽으며, 그들의 생각과 감정을 이해하려 노력한다. 이것이 내가 문학을 통해 세상을 바라보는 방식이다. 각자의 삶에서 빛나는 순간들을 발견하는 것, 그것이 내가 문학에 빠진 이유다.이 짧은 문장에서도, 저자는 계절의 변화와 인간의 내적 감정을 섬세하게 포착하고 있다....\n\n',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/Kimmung_profile.png',
          label: '김뭉',
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
          width: 60.0, // 원하는 크기로 설정
          height: 60.0,
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: selectedImage,
          label: '소설 속 주인공',
        ),
      ],
    );
  }
}

class palette_screen_next_yang extends StatelessWidget {
  @override
  final String selectedImage;
  const palette_screen_next_yang({
    required this.selectedImage,
  });
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/Yangkee_2.png',
      title: '귀여운 것은 곧 사랑이다',
      category: '양아치',
      selectedImage: 'selectedImage',
      tagLine: '#사랑 ' ' ' ' #양아치 ' ' ' ' #배움 ' ' ' ' #깨달음',
      description:
          '양키는 뜨개질을 취미로 가진 사람이다. 양키는 뜨개질을 하며 영화 시청을 한다. 영화 속 인물의 이야기에 몰입하며, 양키의  아름다운 내면의 시선으로 주인공을 바라보며  혼잣말로 감상을 남긴다\n',
      exampleTitle: '예시',
      exampleTextSpans: [
        TextSpan(
          text:
              '양키는 오늘도 저녁빛이 부연한 방안에서 조용히 뜨개질을 하며 영화를 보고 있었다. 손길에는 부드러운 실이 흐르고, 영화 속 김길동의 일상이 흘러나왔다.\n\n"헉, 이 사람도 참 하루하루가 전쟁 같네. 회의에서 의견 뭉개지고, 집에 와서도 잠 못 이루는 거 보니," 양키가 중얼거리며 실을 꼬았다. "정말 힘든 일이지. 남의 마음 안에서 무슨 일이 일어나고 있는지, 그 무게를 다른 사람이 어떻게 알겠어?"\n영화 속 김길동이 운동으로 스트레스를 해소하..',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
            height: 0,
          ),
        ),
        // TextSpan(
        //   text:
        //       '양키 : 야, 너 병원 갔다 왔다며? 왠 병원?\n\n나 : 단순히 건강검진 다녀온 거야.\n\n양키 : 뭐어어? 건강검진??...음 그래 건강은 일찍이 챙겨야지. 근데 너 면상이 왜 이렇게 어둡냐...\n\n',
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontSize: 13,
        //     fontFamily: 'KoPubWorldDotum_Pro',
        //     fontWeight: FontWeight.w300,
        //     height: 0,
        //   ),
        // ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/yangkee_profile.png',
          label: '양키',
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
          width: 60.0, // 원하는 크기로 설정
          height: 60.0,
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: selectedImage,
          label: '손뜨개질 동아리 친구',
        ),
      ],
    );
  }
}

class palette_screen_next_pooh extends StatelessWidget {
  final String selectedImage;
  const palette_screen_next_pooh({
    required this.selectedImage,
  });
  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/Winne the pooh2.png',
      title: 'Winne the Pooh',
      selectedImage: 'selectedImage',
      category: '푸',
      tagLine: '#동화 ' ' ' ' #긍정 ' ' ' ' #귀여움 ' ' ' ' #순수',
      description:
          '위니 더 푸는 동글동글한 얼굴과 큰 눈, 작은 코, 짧은 다리 등 귀여운 외모를 가지고 있으며 항상 밝고 긍정적인 성격을 가지고 있다. 친구들과 함께 노는 것을 좋아하며, 당신은 위니 더 푸와 함께 동화 속에서 한 장의 페이지를 기록하게 됩니다.\n',
      exampleTitle: '예시',
      exampleTextSpans: [
        TextSpan(
          text:
              '어느 멋진 날, 숲속을 산책하던 우리의 친근한 곰돌이 푸와 그의 친구는 맑은 하늘 아래에서 즐겁게 놀고 있었어요. 푸는 그의 친구에게 소중한 이야기를 듣고, 힘든 하루를 보낸 친구를 위해 특별한 날을 만들기로 마음먹었죠. \n\n"오늘은 내가 네게 특별한 게임을 보여줄게," 푸가 말했어요. 그리고 그들은 푸의 고향인 백 헥타르 숲에서 "꿀단지 찾기" 게임을 시작했어요. 함께 벌통을 찾아 나서면서, 친구의 스트레스가 하나둘씩 사라지는 것을 느낄 수 있었죠...',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/pooh_profile.png',
          label: '위니 더 푸',
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
          width: 60.0, // 원하는 크기로 설정
          height: 60.0,
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: selectedImage,
          label: '동화 속 친구',
        ),
      ],
    );
  }
}

class palette_screen_next_Thoreau extends StatelessWidget {
  final String selectedImage;
  const palette_screen_next_Thoreau({
    required this.selectedImage,
  });
  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/Thoreau2.png',
      title: '숲 속을 거닐다',
      selectedImage: 'selectedImage',
      category: '철학자',
      tagLine: '#시인 ' ' ' ' #근대 ' ' ' ' #초현실주의',
      description:
          '헨리 데이비드 소로는 미국의 사상가이자 문학가이며, 자연주의 철학자이다. 대자연 속에서 간단하고 순수한 삶을 추구하며, 독립적인 생활과 개인의 내적 탐구에 대한 중요성을 강조한다. 라디오 디제이로서 소로가 여러분들의 이야기를 들어드립니다. 많은 관심 부탁드려요.\n',
      exampleTitle: '예시',
      exampleTextSpans: [
        TextSpan(
          text:
              '[2023년 1월 23일, 숲 속을 거닐다, 소로의 라디오 방송]\n\n안녕하십니까, 여러분. 오늘도 "숲 속을 거닐다"에서 여러분과 함께합니다. 저는 여러분의 숲 속 DJ, 헨리 데이비드 소로입니다. 오늘 저에게 도착한 한 청취자분의 이야기를 나누겠습니다.\n\n청취자분께서는 아침부터 저녁까지 긴 하루를 보내셨군요. 회의에서 자신의 목소리가 묵살되고, 업무의 부담에 짓눌린 모습이 안타까움을 자아냅니다.저는 먼저 이렇게 말씀드리고 싶습니다...',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/tho_profile.png',
          label: '헨리 데이비드 소로',
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
          width: 60.0, // 원하는 크기로 설정
          height: 60.0,
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: selectedImage,
          label: '청취자',
        ),
      ],
    );
  }
}

class palette_screen_next_leesangv2 extends StatelessWidget {
  final String selectedImage;
  const palette_screen_next_leesangv2({
    required this.selectedImage,
  });

  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/leesangv2_2.png',
      title: '동생 보아라',
      selectedImage: 'selectedImage',
      category: '한국 시인',
      tagLine: '#천재 시인 ' ' ' ' #근대 ' ' ' ' #초현실주의 ' ' ' ' #동생바보',
      description:
          '이상(李箱)은 일제강점기 시대의 대표적인 시인이자 소설가이다. 자의식과 내면 세계를 탐구하며 틀에 박히지 않은 시로 현대시의 새로운 지평을 열었다. 성격과 행동이 워낙 남달랐지만 동생을 아끼는 애틋한 마음을 편지에 담아 전달한다.\n',
      exampleTitle: '예시',
      exampleTextSpans: [
        TextSpan(
          text:
              '동생 이메화 보아라,\n\n차가운 바람이 뼈 속까지 파고드는 요즘이로구나. 매 서린 출근길, 네 마음의 무게가 어떨지 내겐 오롯이 와 닿는다. 동생, 이토록 너를 괴롭히는 세상의 무게에 대해 조금이라도 덜어내고자 몇 자 적는다.\n\n네가 매일을 지옥 같다 여기며 삶의 의미를 의심하는 것, 그런 너의 심정을 못 알 바 아니지만, 너의 고달픔이...',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/lee_profile.png',
          label: '이상',
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
          width: 60.0, // 원하는 크기로 설정
          height: 60.0,
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: selectedImage,
          label: '동생',
        ),
      ],
    );
  }
}

class palette_screen_next_alsoubet extends StatelessWidget {
  final String selectedImage;
  const palette_screen_next_alsoubet({
    required this.selectedImage,
  });
  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/alsoubet and igo2.png',
      title: '그리스 앞바다',
      category: '인물',
      tagLine: '#부조리의 철학 ' ' ' ' #자유 ' ' ' ' #맥주병',
      description:
          '알소베는 현재의 욕망에 몰입하며, 사회적 윤리와 운명적인 모순에 직면하면서도 치열한 삶을 살고자 하며, 이고는 자유와 순수함, 열정과 뜨거움을 가진 인물로 인간의 본연의 아름다움과 열정을 드러낸다. 이들은 어느 날부터 떠내려오는 맥주 명 속 편지를 발견하곤 편지 속 주인공을 궁금해 하기 시작한다.\n',
      exampleTitle: '예시',
      selectedImage: 'selectedImage',
      exampleTextSpans: [
        TextSpan(
          text:
              '알소베는 매일 아침 해변을 걸으며, 혼자만의 시간을 음미했다. 그곳에서 일상의 번잡함을 잠시 벗어나 차분한 마음으로 자신을 돌아보고, 무한한 바다를 바라보며 생의 근원에 대해 사유하는 것이 그의 일과의 시작이었다.\n\n어느 날, 해변가에 이르렀을 때, 파도가 밀려온 맥주 병 하나가 모래 위에 누워 있었다. 그런 평범하지 않은 광경에 알소베는 호기심을 느꼈다. 병을 집어들고 그 안에 들어 있는 종이를 꺼냈다. 종이에는 생소한 이름, "김길동"이 적혀 있었고, 일기장 페이지처럼..',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/als_profile.png',
          label: '알소베&이고',
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
          width: 60.0, // 원하는 크기로 설정
          height: 60.0,
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: selectedImage,
          label: '맥주병 속 편지 주인',
        ),
      ],
    );
  }
}

class palette_screen_next_dongja extends StatelessWidget {
  final String selectedImage;
  const palette_screen_next_dongja({
    required this.selectedImage,
  });
  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/dongja2.png',
      title: '동자청풍',
      category: '동자승',
      tagLine: '#동심 ' ' ' ' #순수 ' ' ' ' #철',
      selectedImage: 'selectedImage',
      description:
          '이레는 호기심 많고 사랑스러운 7살 동자승이다. 매일 아침 일찍 일어나 큰절을 올리며 하루를 시작한다. 순수한 마음을 가지고 있어 세상 모든 것에 호기심이 많고 다른 사람들과 나누는 것을 좋아한다. 절에 오는 손님들에게 먼저 다가가 밝게 인사하며 스님에게 배운 것들을 전달하며 같이 놀고자 한다.\n',
      exampleTitle: '예시',
      exampleTextSpans: [
        TextSpan(
          text:
              '..."안녕하세요, 이메화님! 아, 저는 이레예요. 동자승이에요. 오늘은 어떤 날이셨나요?" 이레는 손을 흔들며 대답했어요.\n\n이메화님이 회사에서 힘들었다는 이야기를 들은 이레는 잠시의 침묵을 지키더니 그녀의 손을 잡고 조심스레 말했어요.\n\n“스님이 때때로 말씀하셨어요. 삶은 때로 힘들고 불공평할 수 있지만, 우리는 그것을 통해 더욱 강해질 수 있다고… 혹시 지금 그런 감정을 조금이라도 덜게 도와드릴 게 있을까요?" 크리스마스 ..',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/dongja_profile.png',
          label: '이레',
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
          width: 60.0, // 원하는 크기로 설정
          height: 60.0,
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: selectedImage,
          label: '손님',
        ),
      ],
    );
  }
}

class palette_screen_next_jang extends StatelessWidget {
  final String selectedImage;
  const palette_screen_next_jang({
    required this.selectedImage,
  });
  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/jang2.png',
      title: '풍하마을 수호 장승',
      category: '장승',
      tagLine: '#풍하 ' ' ' ' #장승 ' ' ' ' #투명한 삶',
      selectedImage: 'selectedImage',
      description:
          '풍하 마을을 수호하는 천하대장군과 지하여장군, 지나가려는 나그네는 이들에게 자신은 심신이 투명한 자인 것을 증명해야 한다. 장승들은 나그네의 삶을 듣고 이 사람이 어떤 사람이고 어떤 생각으로 살아가고 있는 지 판단하여 입장을 허한다.\n',
      exampleTitle: '예시',
      exampleTextSpans: [
        TextSpan(
          text:
              '"안녕하신지요 천하대장군님. 지하여장군님. 풍하마을을 들어가려하는 나그네입니다. 들어가도 될까요?"라고 나그네가 말했다.  "이 마을에 들어가려면 너의 속내를 밝혀야 한다." 천하대장군이 말했습니다. "어떻게 하면 되까요?" 나그네가 물었다. 그 말을 들은 천하대장군은 당황했다. "이런 그걸 생각하지 못했네. 여보! 이거 어찌하고 우리도 처음이라 근엄하게만 하면 될 줄 알았는데!" 지하여장군에게 물었다. "오늘 뭘했는지 무슨 생각을 했는지 물어보세요" 지하여장군이 답했다. "오 그거 좋은 생각이군! 크흠 네가 오늘 무엇을 했는지 밝혀라! 이 풍하마을은 심신이 투명한 자만이...',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/jang_profile.png',
          label: '천하대장군&지하여장군',
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
          width: 60.0, // 원하는 크기로 설정
          height: 60.0,
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: selectedImage,
          label: '나그네',
        ),
      ],
    );
  }
}

class palette_screen_next_yeonhwa extends StatelessWidget {
  final String selectedImage;
  const palette_screen_next_yeonhwa({
    required this.selectedImage,
  });
  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/yeonhwa2.png',
      title: '심연의 화원',
      selectedImage: 'selectedImage',
      category: '꽃집 사장',
      tagLine: '#꽃말 ' ' ' ' #응원 ' ' ' ' #동네 꽃집',
      description:
          '연화는 동네에서 꽃집을 운영하며, 마음을 읽는 능력을 가지고 있다. 능력을 통해 동네 주민들의 고민과 걱정, 기분을 알아차리고 그들에게 도움이 될 수 있도록 꽃말과 같이 꽃을 추천해주며, 꽃의 언어로 위로와 격려를 전달한다. 연화는 그들의 마음을 위로하며 오늘의 꽃을 피워낸다.\n',
      exampleTitle: '예시',
      exampleTextSpans: [
        TextSpan(
          text:
              '... 장미는 이 세상 어떤 꽃보다 아름답고 강한 매력을 가지고 있다는 것을 연화는 잘 알고 있었다. 인간의 감정과 가장 밀접한 연관성을 지닌 꽃이라 할 수 있었다.\n\n그런데 이메화가 꽃집 앞을 지나가며 한숨을 쉬는 모습을 보았다. 연화는 조용히 그의 상태를 읽어 보았다. 내면의 피로감, 아픔, 화, 불만... 꾸밈 없는 감정이 연화를 거칠게 쳤다. 이메화는 연말에 혼자 외롭게 보내는 생각에 더 큰 외로움과 절망을 느끼고 있었다.\n연화는 그에게 송이 꽃을 권했다. 크리스마스 장미였다...`',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/yeonhwa_profile.png',
          label: '연화',
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
          width: 60.0, // 원하는 크기로 설정
          height: 60.0,
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: selectedImage,
          label: '동네 주민',
        ),
      ],
    );
  }
}

class palette_screen_next_halmae extends StatelessWidget {
  final String selectedImage;
  const palette_screen_next_halmae({
    required this.selectedImage,
  });
  @override
  Widget build(BuildContext context) {
    return PaletteScreen(
      imagePath: 'assets/images/halmae2.png',
      title: '우리 아가 왔나',
      category: '할머니',
      tagLine: '#할매 ' ' ' ' #사랑 ' ' ' ' #내 편',
      description:
          '할머니의 댓가없는 사랑과 끝없는 지지를 주며 일상에서 겪는 어려움과 고민을 들어주고 위로와 격려를 건넨다. 자신의 가치를 깨닫고, 행복을 스스로 찾아갈 수 있도록 할머니의 정성과 관심을 전한다.\n',
      exampleTitle: '예시',
      selectedImage: 'selectedImage',
      exampleTextSpans: [
        TextSpan(
          text:
              '"어차피 내일도 또 그런 상황을 마주 해야하는데 할머닌 어떻게 할 수 있을지 조언을 받고 싶어요." 나는 조금은 두려운 마음으로 할머니에게 물었다.\n"막둥아, 알아봐. 뭐든지 할 수 있어. 애기때부터 이 할매 옆에서 볼 때부터 그랬어. 그런 상사가 뭐얏다고 너한테 그런 일로 힘들게 하눈데. 뭐 그런 사람은 별무시만 혀. 그런 사람이 할 수 있는 최대한으로 피하렴이."\n\n"막둥아, 이 할매는 내 막둥이가 항상 건강하고, 행복하면 좋겨..',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'KoPubWorldBatang_Pro',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
      relationImages: [
        RelationImage(
          imagePath: 'assets/images/halmae_profile.png',
          label: '할매',
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: 'assets/images/Pi_Relationship_ig.png',
          label: '',
          width: 60.0, // 원하는 크기로 설정
          height: 60.0,
        ),
        SizedBox(
          width: 8,
        ),
        RelationImage(
          imagePath: selectedImage,
          label: '손주',
        ),
      ],
    );
  }
}
