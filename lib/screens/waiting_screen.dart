import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_controller/screens/controller_screen.dart';
import 'package:remote_controller/screens/loading_screen.dart';
import 'package:remote_controller/services/devices_model.dart';

class WaitingScreen extends StatefulWidget {
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<DevicesModel>(context).ready == false
        ? LoadingScreen()
        : ControllerScreen();
  }
}
