import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:remote_controller/services/device_data.dart';
import 'package:remote_controller/services/device_data_retriever.dart';

class DevicesModel with ChangeNotifier {
  List<DeviceData> _devices = [];
  bool ready = false;
  Timer refreshTimer;

  DevicesModel(BuildContext context) {
    refreshTimer =
        Timer.periodic(Duration(seconds: 100), (refreshTimer) => refreshData());
    refreshData();
    notifyListeners();
  }

  void setReady(bool r) => ready = ready;
  void cancelTimer() => refreshTimer.cancel();
  void startTimer() {
    refreshData();
    Timer.periodic(Duration(seconds: 10), (refreshTimer) => refreshData());
  }

  List<DeviceData> getDevicesList() =>
      _devices != null ? List.unmodifiable(_devices) : null;

  Future<void> refreshData() async {
    _devices = await DevicesDataRetriever().getDevicesMap();
    ready = true;
    notifyListeners();
  }

  void setNewTemperature({double newTemperature, String deviceId}) async {
    DeviceData device =
        _devices.firstWhere((DeviceData dev) => dev.id == deviceId);
    var result = await DevicesDataRetriever()
        .setDeviceTemperature(device: device, temperature: newTemperature);
    //TODO menage error
    notifyListeners();
  }

  void togglePower(String id) async {
    DeviceData device = _devices.firstWhere((DeviceData dev) => dev.id == id);
    var result = await DevicesDataRetriever().togglePower(device);
    //TODO menage error
    notifyListeners();
  }
}
