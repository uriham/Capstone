import 'package:flutter/material.dart';

class CustomCard_myao extends StatelessWidget {
  final VoidCallback onTap; // 클릭 이벤트
  const CustomCard_myao({super.key, required this.onTap}); // 생성자

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 클릭 이벤트로 이동
      child: Container(
        width: 360,
        height: 600,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                'assets/images/miaomao.png',
                width: 300,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                child: Text(
                  '고양이',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                child: Text(
                  '먀오마아의 은밀한 취미생활',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Padding(
              // 네 번째 텍스트 상자
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Container(
                // 배경색 검은색
                child: Text(
                  '"먀오마아"는 주인의 일기를 훔쳐보는 고양이이다. 먀오마아는 퉁명스럽고 귀찮음이 많지만 주인이 잠든 새벽에 주인의 일기를 보며 주인을 관찰하는 것이 취미이다. 본능에 충실한 고양이로서, 인간들의 심리, 생각, 고정관념에 대해서 이해와 공감을 하지 못하지만 주인을 향한 애정은 확실하다.\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard_mmung extends StatelessWidget {
  final VoidCallback onTap; // 클릭 이벤트
  const CustomCard_mmung({super.key, required this.onTap}); // 생성자

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 클릭 이벤트로 이동
      child: Container(
        width: 360,
        height: 600,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                'assets/images/kimmung_2.png',
                width: 300,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                child: Text(
                  '대학생',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                child: Text(
                  '우리도 모르는 우리들의 별빛',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Padding(
              // 네 번째 텍스트 상자
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Container(
                // 배경색 검은색
                child: Text(
                  ' 김뭉은 평범한 대학생이다. 사람은 저마다의 빛을 가지고 있다. 다만 모든 이들이 깨닫지 못한다. 김뭉은 한 사람의 인생 스토리가 닮긴 소설책을 읽으며, 주인공의 빛을 발견한다. 사람들의 심리를 이해하고 관찰하며 자신 또한 그들로 인해 깨닮음을 얻고자한다.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard_yang extends StatelessWidget {
  final VoidCallback onTap; // 클릭 이벤트
  const CustomCard_yang({super.key, required this.onTap}); // 생성자

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 클릭 이벤트로 이동
      child: Container(
        width: 360,
        height: 600,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                'assets/images/Yangkee_2.png',
                width: 300,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                child: Text(
                  '양아치',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                child: Text(
                  '귀여운 것은 곧 사랑이다',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Padding(
              // 네 번째 텍스트 상자
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Container(
                // 배경색 검은색
                child: Text(
                  '손뜨개를 좋아하는 양키. 아무도 자신이 손뜨개질을 좋아하는 지 모른다. 같이 손뜨개질을 하는 친구 빼고. 입이 험하고 행동이 거칠지만 귀여운 것을 좋아하는 순수한 소년이다. 친구에게 거칠게 입막음을 하지만 친구의 이야기를 잘 들어주며 그의 단순한 생각회로로 도움을 줄 때도 있다 ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard_poet extends StatelessWidget {
  final VoidCallback onTap; // 클릭 이벤트
  const CustomCard_poet({super.key, required this.onTap}); // 생성자

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 클릭 이벤트로 이동
      child: Container(
        width: 360,
        height: 600,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                'assets/images/Yangkee_2.png',
                width: 300,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                child: Text(
                  '양아치',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                child: Text(
                  '귀여운 것은 곧 사랑이다',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Padding(
              // 네 번째 텍스트 상자
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Container(
                // 배경색 검은색
                child: Text(
                  '손뜨개를 좋아하는 양키. 아무도 자신이 손뜨개질을 좋아하는 지 모른다. 같이 손뜨개질을 하는 친구 빼고. 입이 험하고 행동이 거칠지만 귀여운 것을 좋아하는 순수한 소년이다. 친구에게 거칠게 입막음을 하지만 친구의 이야기를 잘 들어주며 그의 단순한 생각회로로 도움을 줄 때도 있다 ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontFamily: 'KoPubWorldDotum_Pro',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
