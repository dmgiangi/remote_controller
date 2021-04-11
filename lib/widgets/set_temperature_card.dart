import 'package:flutter/material.dart';
import 'package:remote_controller/widgets/number_picker.dart';

class SetTemperatureCard extends StatelessWidget {
  final Function(double) onNewValue;
  final double initialValue;

  SetTemperatureCard({@required this.initialValue, @required this.onNewValue});

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
          Text(
            'Imposta temperatura ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.tealAccent,
            ),
          ),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
                border: Border.all(
                  color: Colors.teal,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: NumberPicker(
                minValue: 4,
                maxValue: 40,
                divisions: 72,
                initialValue: initialValue,
                backgroundColor: Colors.transparent,
                onNewValue: onNewValue,
              )),
        ],
      ),
    );
  }
}
