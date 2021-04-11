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
            var result = jsonDecode(response);
            device.readTemperature = result['readTemp'].toDouble();
            device.setTemperature = result['setTemp'].toDouble();
            device.coldRelay = result['frigo'];
            device.hotRelay = result['stufa'];
            device.localIp = result['localIP'];
            device.probeFail = result['SondeFail'];
            device.power = result['PowerState'];
          } else {
            //TODO consider error
          }
        }
      }
      return devicesList;
    } else {
      //TODO consider error
    }
  }

  Future setDeviceTemperature({DeviceData device, double temperature}) async {
    var response = await NetworkHelper().setDataTemperature(
      deviceId: device.id,
      temperature: temperature,
    );
    if (response is! int) {
      var result = jsonDecode(response);
      if (temperature == result['out']['setTemp'].toDouble()) {
        device.setTemperature = result['out']['setTemp'].toDouble();
        return true;
      } else
        return false;
    } else {
      //TODO handle error
    }
  }

  Future togglePower(DeviceData device) async {
    var response = await NetworkHelper().setPower(
      deviceId: device.id,
      power: !device.power,
    );
    if (response is! int) {
      var result = jsonDecode(response);
      if (!device.power == result['out']['PowerState']) {
        device.power = result['out']['PowerState'];
        return true;
      } else
        return false;
    } else {
      //TODO handle error
    }
  }
}
