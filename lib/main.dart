import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_controller/screens/waiting_screen.dart';
import 'package:remote_controller/services/devices_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: ChangeNotifierProvider<DevicesModel>(
        create: (context) => DevicesModel(context),
        lazy: false,
        child: WaitingScreen(),
      ),
    );
  }
}
