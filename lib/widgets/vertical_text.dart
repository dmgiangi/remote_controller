import 'package:flutter/material.dart';

class VerticalText extends StatelessWidget {
  VerticalText({this.text, this.style});
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
