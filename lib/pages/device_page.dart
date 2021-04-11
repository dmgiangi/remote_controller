import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_controller/pages/offline_device_page.dart';
import 'package:remote_controller/services/device_data.dart';
import 'package:remote_controller/services/devices_model.dart';
import 'package:remote_controller/widgets/led_card.dart';
import 'package:remote_controller/widgets/read_temperature_card.dart';
import 'package:remote_controller/widgets/set_temperature_card.dart';

class DevicePage extends StatelessWidget {
  final DeviceData deviceData;

  DevicePage(this.deviceData);

  @override
  Widget build(BuildContext context) {
    return deviceData.online == false
        ? OfflineDevicePage()
        : Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            color: Colors.blueGrey[600],
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReadTemperatureCard(deviceData.readTemperature),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[700],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[800],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.power_settings_new,
                                  color: deviceData.power
                                      ? Colors.tealAccent
                                      : Colors.grey),
                              iconSize: 70,
                              onPressed: () => Provider.of<DevicesModel>(
                                context,
                                listen: false,
                              ).togglePower(deviceData.id),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  LedCard(ledMap: {
                    'Freddo': deviceData.coldRelay,
                    'Caldo': deviceData.hotRelay,
                  }),
                  SetTemperatureCard(
                    initialValue: deviceData.setTemperature,
                    onNewValue: (newTemp) {
                      Provider.of<DevicesModel>(context, listen: false)
                          .setNewTemperature(
                        newTemperature: newTemp,
                        deviceId: deviceData.id,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
