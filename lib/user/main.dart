// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter/material.dart';
//
// import 'package:parking_pay_service/common/view/splash_page.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await _initialize();
//   runApp(MyApp());
// }
//
// // Future<void> _initialize() async {
// //   await NaverMapSdk.instance.initialize(
// //       clientId: 'n8ygu8s7fg',
// //       onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed"));
// //   runApp(MyApp());
// // }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Parking Pay Service',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashPage(),
//     );
//   }
// }

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:parking_pay_service/common/view/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: "n8ygu8s7fg");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parking Pay Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}
