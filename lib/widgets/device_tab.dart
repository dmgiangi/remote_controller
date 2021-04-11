import 'package:flutter/material.dart';
import 'package:remote_controller/utilities/constants.dart';

class DeviceTab extends StatelessWidget {
  final String _name;
  final bool _online;

  DeviceTab({String name, bool online})
      : _name = name,
        _online = online;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: _online == true ? activeColor : inactiveColor,
          ),
          SizedBox(width: 10),
          Text(
            _name,
            style: TextStyle(
              color: Colors.tealAccent,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
