import 'package:flutter/cupertino.dart';
import 'package:remote_controller/services/device_data.dart';
import 'package:remote_controller/services/device_data_retriever.dart';

class DevicesModel with ChangeNotifier {
  List<DeviceData> chambers;
  bool ready = false;
  DevicesModel(BuildContext context) {
    refreshData();
    notifyListeners();
  }

  Future<void> refreshData() async {
    chambers = await DevicesDataRetriever().getDevicesMap();
    ready = true;
    notifyListeners();
  }

  void setNewTemperature(double newTemperature, String chamberName) {
    //TODO implemts set new Temperature
    refreshData();
  }
}
