import 'package:flutter/material.dart';

class ReadTemperatureCard extends StatelessWidget {
  final double temperature;

  ReadTemperatureCard(this.temperature);
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
            'Temperatura reale',
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
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      temperature != -127.0 ? temperature : 'Errore\nsonda',
                      style: temperature != -127.0
                          ? TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                              color: Colors.tealAccent,
                            )
                          : TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.tealAccent,
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
