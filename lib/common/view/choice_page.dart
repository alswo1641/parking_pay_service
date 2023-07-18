import 'package:flutter/material.dart';

import 'homepage.dart';

class MainLocation extends StatefulWidget {
  const MainLocation({super.key});

  @override
  _MainLocationState createState() => _MainLocationState();
}

class _MainLocationState extends State<MainLocation> {
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
                  text: '주 활동지역을',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
              TextSpan(
                  text:
                      '                                              1 / 7 \n',
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
                  text: '\n\n주로 활동하시는 지역을 선택해 주세요.',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 17,
                      fontWeight: FontWeight.w100))
            ]),
          ),
          SizedBox(
            height: 50,
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
                  '전국',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(41, 40, 41, 40),
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
                  '서울',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(42, 40, 42, 40),
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
                  '경기도 남부',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(23, 40, 23, 40),
                    primary: _isSelected[2] ? Colors.white24 : null,
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
                    _isSelected[3] = !_isSelected[3];
                  });
                },
                child: Text('경기도 북부',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                    primary: _isSelected[3] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSelected[4] = !_isSelected[4];
                  });
                },
                child: Text(
                  '충청남도',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
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
                  '충청북도',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
                    primary: _isSelected[5] ? Colors.white24 : null,
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
                    _isSelected[6] = !_isSelected[6];
                  });
                },
                child: Text(
                  '전라남도',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(28, 40, 28, 40),
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
                  '전라북도',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
                    primary: _isSelected[7] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSelected[8] = !_isSelected[8];
                  });
                },
                child: Text(
                  ' 경상남도',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
                    primary: _isSelected[8] ? Colors.white24 : null,
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
                    _isSelected[9] = !_isSelected[9];
                  });
                },
                child: Text(
                  '경상북도',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(27, 40, 27, 40),
                    primary: _isSelected[9] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSelected[10] = !_isSelected[10];
                    ;
                  });
                },
                child: Text(
                  '강원도',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(36, 40, 36, 40),
                    primary: _isSelected[10] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSelected[11] = !_isSelected[11];
                  });
                },
                child: Text(
                  '제주도',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(37, 40, 37, 40),
                    primary: _isSelected[11] ? Colors.white24 : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/nexto');
          },
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
    home: MainLocation(),
  ));
}
