import 'package:remote_controller/services/network_helper.dart';

class ChamberDataRetriever {
  Future getDevicesMap() async {
    var result = await NetworkHelper().getDevices();
    if (result is List) {
      //TODO return the result
    } else {
      //TODO consider error
    }
  }
}

/*
import 'package:remote_controller/services/chamber_data.dart';
import 'package:remote_controller/services/network_helper.dart';

class ChamberDataRetriever {
  Future<List<ChamberData>> getChamberData() async {
    NetworkHelper networkHelper = NetworkHelper();
    var status = await networkHelper.getStatus();
    if (status is bool) {
      chamberData.online = true;
      var data = await networkHelper.getData();
      if (data is! int) {
        chamberData.readTemperature = data["sondaTemp"];
        //chamberData.setTemperature;

        chamberData.frigoRelay = data["frigo"];
        chamberData.stufaRelay = data["stufa"];
        chamberData.localIp = data["localIP"];
        chamberData.sondeFail = data["SondeFail"];
        chamberData.requestStatusError = 200;
        chamberData.requestDataError = 200;
      } else {
        chamberData.requestDataError = data;
        chamberData.requestStatusError = 0;
        chamberData.readTemperature = 0;
        //chamberData.setTemperature = false;
        chamberData.frigoRelay = false;
        chamberData.stufaRelay = false;
        chamberData.localIp = '';
        chamberData.sondeFail = false;
      }
    } else {
      chamberData.requestStatusError = status;
      chamberData.readTemperature = 0;
      //chamberData.setTemperature;
      chamberData.frigoRelay = false;
      chamberData.stufaRelay = false;
      chamberData.localIp = '';
      chamberData.sondeFail = false;
      chamberData.requestDataError = 0;
    }
  }
}
*/
