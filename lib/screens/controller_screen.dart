import 'package:flutter/material.dart';

class ControllerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_4_bar,
                        color: Colors.lightBlueAccent,
                        size: 30,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Cella Graffio',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.refresh,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.power_settings_new,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      ),
                    ],
                  )
                ],
              ),
              Text(
                'Local IP: 192.168.1.173',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Global IP: 151.43.214.1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
