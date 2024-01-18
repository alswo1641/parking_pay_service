import 'package:flutter/material.dart';
import 'package:parking_pay_service/common/layout/app_text.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF149D9B)),
            ),
            SizedBox(height: 20),
            Text('Loading...', style: AppTextTheme.black20m),
          ],
        ),
      ),
    );
  }
}
