import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:remote_controller/utilities/thinger_constant.dart';

class NetworkHelper {
  Future getDevices() async {
    http.Response response = await http.get(
      devicesUrl,
      headers: dataHeaders,
    );
    print('Effettuata Richiesta: Lista dispositivi');
    return response.statusCode == 200 ? response.body : response.statusCode;
  }

  Future getDevicesResources(String deviceId) async {
    final Uri resourceUrl = Uri.https(
      tgrURL,
      tgrResourcePathStart + deviceId + tgrResourcePathEnd,
    );
    http.Response response = await http.post(
      resourceUrl,
      headers: dataHeaders,
    );
    print('Effettuata Richiesta: Risorse dispositivi');
    return response.statusCode != 200 ? response.statusCode : response.body;
  }

  Future setDataTemperature(
      {@required String deviceId, @required double temperature}) async {
    http.Response response = await http.post(
      Uri.https(tgrURL, SetDataPathStart + deviceId + tgrSetDataPathEnd),
      headers: dataHeaders,
      body: '{"cellaTempSet": $temperature}',
    );
    print('Effettuata Richiesta: Impostata temperatura');
    return response.statusCode != 200 ? response.statusCode : response.body;
  }

  Future setPower({@required String deviceId, @required bool power}) async {
    http.Response response = await http.post(
      Uri.https(tgrURL, SetDataPathStart + deviceId + tgrSetDataPathEnd),
      headers: dataHeaders,
      body: '{"power": ${power.toString()}}',
    );
    print('Effettuata Richiesta: Modifica stato accensione');
    return response.statusCode != 200 ? response.statusCode : response.body;
  }
}
