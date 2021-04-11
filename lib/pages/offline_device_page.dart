import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_controller/services/devices_model.dart';

class OfflineDevicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
      color: Colors.blueGrey[600],
      child: MaterialButton(
        onPressed: () => Provider.of<DevicesModel>(
          context,
          listen: false,
        ).refreshData(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restore_page,
              color: Colors.tealAccent,
              size: 200,
            ),
            Text(
              '''il dispositivo è offline. Connettilo e clicca qui per ricaricare.''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.tealAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
