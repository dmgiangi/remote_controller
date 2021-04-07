import 'dart:convert';

import 'package:remote_controller/services/device_data.dart';
import 'package:remote_controller/services/network_helper.dart';

class DevicesDataRetriever {
  Future getDevicesMap() async {
    var result = await NetworkHelper().getDevices();
    if (result is! int) {
      var devices = jsonDecode(result);
      List<DeviceData> devicesList = [];

      for (var device in devices) {
        devicesList.add(DeviceData(
          name: device['name'],
          id: device['device'],
          online: device['connection']['active'],
          description: device['description'],
        ));
      }

      for (var device in devicesList) {
        if (device.online == true) {
          var response = await NetworkHelper().getDevicesResources(device.id);
          if (response is! int) {
            print(response);
            var result = jsonDecode(response);
            print(result);
            device.readTemperature = result['readTemp'].toDouble();
            device.setTemperature = result['setTemp'].toDouble();
            device.coldRelay = result['frigo'];
            device.hotRelay = result['stufa'];
            device.localIp = result['localIP'];
            device.probeFail = result['SondeFail'];
          } else {
            //TODO consider error
          }
        }
      }
      return devicesList;
    } else {
      print(result);
      //TODO consider error
    }
  }
}
