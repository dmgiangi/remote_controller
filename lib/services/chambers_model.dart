import 'package:remote_controller/services/chamber_data.dart';
import 'package:flutter/cupertino.dart';

class ChambersModel extends ChangeNotifier {
  List<ChamberData> chambers;

  ChambersModel() {
    refreshData();
  }

  void refreshData() {
    //TODO implements refresh data
    notifyListeners();
  }

  void setNewTemperature(double newTemperature, String chamberName) {
    //TODO implemts set new Temperature
    refreshData();
  }
}
