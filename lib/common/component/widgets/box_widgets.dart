import 'package:flutter/material.dart';

class BoxWidgets {
  static Widget infoBox(String text, Color color, {double? width}) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
