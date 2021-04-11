import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:provider/provider.dart';
//import 'package:remote_controller/screens/controller_screen.dart';
//import 'package:remote_controller/services/devices_model.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'title',
            child: Text(
              'REMOTE CONTROLLER',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 30),
          SpinKitDoubleBounce(
            color: Colors.teal,
            size: 100.0,
          ),
        ],
      ),
    );
  }
}
