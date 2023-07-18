import 'package:flutter/material.dart';

import 'homepage.dart';

class Choice_first extends StatefulWidget {
  const Choice_first({super.key});

  @override
  _Choice_firstState createState() => _Choice_firstState();
}

class _Choice_firstState extends State<Choice_first> {
  bool isButtonVisible = false;

  void _toggleButton() {
    setState(() {
      isButtonVisible = !isButtonVisible;
    });
  }

  final List<bool> _isSelected = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset('images/film_choice.png'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => LogIn()));
            },
            color: Colors.white,
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          backgroundColor: Colors.black),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 0.7,
            width: 400.0,
            color: Colors.white60,
          ),
          SizedBox(height: 30),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '첫번째 선호 분야를',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
              TextSpan(
                  text: '                                    4 / 7 \n',
                  style: TextStyle(
                      color: Colors.white60,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
              TextSpan(
                  text: '선택해 주세요.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
              TextSpan(
                  text: '\n\n가장 선호하시는 분야와 장르를 선택해주세요.',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 17,
                      fontWeight: FontWeight.w100))
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            // Container의 높이 설정
            color: Colors.black, // Container의 배경색 설정
            child: Align(
              alignment: Alignment.topLeft, // Child의 위치를 오른쪽 하단으로 설정
              child: Padding(
                padding: EdgeInsets.all(16.0), // Child의 여백 설정
                child: Text(
                  ' 선호분야', // 표시할 텍스트 설정
                  style: TextStyle(
                      fontSize: 20, // 텍스트의 크기 설정
                      color: Colors.white, // 텍스트의 색상 설정
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSelected[0] = !_isSelected[0];
                  });
                },
                child: Text(
                  '영화',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    primary: _isSelected[0] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSelected[1] = !_isSelected[1];
                  });
                },
                child: Text(
                  '드라마',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    primary: _isSelected[1] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSelected[2] = !_isSelected[2];
                  });
                },
                child: Text(
                  '다큐멘터리',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    primary: _isSelected[2] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSelected[3] = !_isSelected[3];
                  });
                },
                child: Text(
                  '예능',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    primary: _isSelected[3] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSelected[4] = !_isSelected[4];
                  });
                },
                child: Text('광고',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    primary: _isSelected[4] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSelected[5] = !_isSelected[5];
                  });
                },
                child: Text(
                  '홍보영상',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    primary: _isSelected[5] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSelected[6] = !_isSelected[6];
                  });
                },
                child: Text(
                  '뮤직비디오',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    primary: _isSelected[6] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSelected[7] = !_isSelected[7];
                  });
                },
                child: Text(
                  '교양',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    primary: _isSelected[7] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
          SizedBox(height: 25),
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: '영화',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' 장르',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )
            ],
          )),
          SizedBox(height: 10),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            '다음',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Choice_first(),
  ));
}
