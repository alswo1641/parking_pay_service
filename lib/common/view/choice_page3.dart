import 'package:flutter/material.dart';

import 'homepage.dart';

class AssistantAbility extends StatefulWidget {
  const AssistantAbility({super.key});

  @override
  _AssistantAbilityState createState() => _AssistantAbilityState();
}

class _AssistantAbilityState extends State<AssistantAbility> {
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
                  text: '보조 역량을',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
              TextSpan(
                  text:
                      '                                                          3 / 7 \n',
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
                  text: '\n\n보유하신 보조 역량을 선택해 주세요.',
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
                  '배우',
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
                  '영화 감독',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
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
                  '드라마 감독',
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
                child: Text('예능 PD',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
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
                  '다큐멘터리\n감독',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
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
                  '시사/고양\nPD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(28, 32, 28, 32),
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
                  '촬영 감독',
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
                  '카메라\n오퍼레이터',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
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
                  '포커스\n풀러',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(38, 30, 38, 30),
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
                  '음향 감독',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(28, 40, 28, 40),
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
                  '오디오\n오퍼레이터',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
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
                  '조명 감독',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
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
            Navigator.pushNamed(context, '/choicefirst');
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
    home: AssistantAbility(),
  ));
}
