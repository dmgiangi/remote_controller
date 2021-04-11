import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_controller/screens/controller_screen.dart';
import 'package:remote_controller/screens/loading_screen.dart';
import 'package:remote_controller/services/devices_model.dart';

class WaitingScreen extends StatefulWidget {
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    state == AppLifecycleState.resumed
        ? Provider.of<DevicesModel>(context, listen: false).startTimer()
        : Provider.of<DevicesModel>(context, listen: false).cancelTimer();
    state == AppLifecycleState.resumed
        ? print('app visibile')
        : print('app non visibile');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DevicesModel>(
      builder: (context, devices, child) =>
          devices.ready ? ControllerScreen() : LoadingScreen(),
    );
  }
}
