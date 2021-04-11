import 'package:flutter/material.dart';
import 'package:remote_controller/utilities/constants.dart';
import 'package:remote_controller/widgets/led_indicator.dart';

class LedCard extends StatelessWidget {
  final Map<String, bool> ledMap;

  LedCard({this.ledMap});

  List<Widget> ledList() {
    List<Widget> ledIndicator = [];
    ledMap.forEach((name, state) {
      ledIndicator.add(LedIndicator(name, state));
      ledIndicator.add(SizedBox(height: 10));
    });
    return ledIndicator;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey[700],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text('Stato attuatori', style: cardTitleStyle),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueGrey[800],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ledList(),
            ),
          ),
        ],
      ),
    );
  }
}
