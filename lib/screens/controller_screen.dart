import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_controller/pages/device_page.dart';
import 'package:remote_controller/services/device_data.dart';
import 'package:remote_controller/services/devices_model.dart';
import 'package:remote_controller/widgets/device_tab.dart';

class ControllerScreen extends StatelessWidget {
  List<DeviceTab> tabListGenerator(List<DeviceData> devices) {
    List<DeviceTab> tabList = [];
    if (devices != null) {
      for (var device in devices)
        tabList.add(DeviceTab(
          name: device.id,
          online: device.online,
        ));
    } else {
      //TODO pop back
    }
    return tabList;
  }

  List<DevicePage> devicePagesGenerator(List<DeviceData> devices) {
    List<DevicePage> devicePages = [];
    if (devices != null) {
      for (var device in devices) devicePages.add(DevicePage(device));
    } else {
      //TODO pop back
    }
    return devicePages;
  }

  @override
  Widget build(BuildContext context) {
    //generating a new Tab List
    //tab List contains only device device Name and the state (online/offline)
    final devices = Provider.of<DevicesModel>(context).getDevicesList();
    final List<DeviceTab> tabList = tabListGenerator(devices);
    //generating Tab Contenent
    final List<DevicePage> devicePages = devicePagesGenerator(devices);

    return DefaultTabController(
      length: devices != null ? devices.length : 1,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[900],
            centerTitle: true,
            title: Text(
              'REMOTE CONTROLLER',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.tealAccent,
              ),
            ),
            bottom: PreferredSize(
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.teal,
                  tabs: tabList,
                ),
                preferredSize: Size.fromHeight(30.0)),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.tealAccent,
                  ),
                  tooltip: 'refresh all data',
                  onPressed: () => Provider.of<DevicesModel>(
                    context,
                    listen: false,
                  ).refreshData(),
                ),
              ),
            ],
          ),
          body: TabBarView(children: devicePages)),
    );
  }
}
