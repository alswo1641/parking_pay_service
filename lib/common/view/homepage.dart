import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  get text => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 130.0,
            ),
            Container(
              child: Image.asset(
                'images/film.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '  AI가 만드는 매칭,\n완벽한 영상제작협업',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 19.5,
                        fontWeight: FontWeight.w500))
              ]),
            ),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/next');
              },
              child: Row(
                //spaceEvenly: 요소들을 균등하게 배치하는 속성
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/glogo.png'),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Google로 로그인하기',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.5,
                        fontWeight: FontWeight.w700),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset('images/glogo.png'),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                //shadowColor: Colors.black, 그림자 추가하는 속성

                minimumSize: Size.fromHeight(50), // 높이만 50으로 설정
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    // shape : 버튼의 모양을 디자인 하는 기능
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/next');
              },
              child: Row(
                //spaceEvenly: 요소들을 균등하게 배치하는 속성
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.apple,
                    size: 18,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Apple 로그인',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.5,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFFFFF),
                minimumSize: Size.fromHeight(50),
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              height: 0.6,
              width: 500.0,
              color: Colors.white24,
            ),
            SizedBox(
              height: 130.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '위의 "Apple/Google로 계속하기" 를 클릭하면 \nFILM US의 ',
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: '이용약관',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.5,
                      )),
                  TextSpan(
                      text: ' 및 ',
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 13,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: '개인정보 보호정책',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.5,
                      )),
                  TextSpan(
                      text: '을 읽고 이해했으며\n그에 동의하는 것으로 간주됩니다.',
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 13,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                '이용약관 및 개인정보 보호정책    도움이 필요하세요?\n\nⓒ2023 FILM US',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 42,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.indigo[700],
    );
  }
}
