import 'package:filmus/common/view/choice_page.dart';
import 'package:filmus/common/view/choice_page2.dart';
import 'package:filmus/common/view/choice_page3.dart';
import 'package:filmus/common/view/firstprefer.dart';
import 'package:filmus/common/view/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LogIn(),
        '/next': (context) => MainLocation(),
        '/nexto': (context) => MainAbility(),
        '/nextoo': (context) => AssistantAbility(),
        '/choicefirst': (context) => Choice_first()
      },
    );
  }
}
