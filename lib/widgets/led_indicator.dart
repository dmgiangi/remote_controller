import 'package:flutter/material.dart';
import 'package:remote_controller/utilities/constants.dart';

class LedIndicator extends StatelessWidget {
  final String name;
  final bool state;

  LedIndicator(this.name, this.state);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle,
            size: 30, color: state ? activeColor : inactiveColor),
        SizedBox(width: 15),
        Text(
          name,
          style: TextStyle(
            fontSize: 25,
            color: Colors.tealAccent,
          ),
        ),
      ],
    );
  }
}
