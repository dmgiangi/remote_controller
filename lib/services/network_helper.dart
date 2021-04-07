import 'package:http/http.dart' as http;
import 'package:remote_controller/utilities/thinger_constant.dart';

class NetworkHelper {
  Future getDevices() async {
    http.Response response = await http.get(
      devicesUrl,
      headers: dataHeaders,
    );
    return response.statusCode == 200 ? response.body : response.statusCode;
  }

  Future getDevicesResources(String deviceId) async {
    final Uri resourceUrl = Uri.https(
      tgrURL,
      tgrResourcePath1 + deviceId + tgrResourcePath2,
    );
    http.Response response = await http.post(
      resourceUrl,
      headers: dataHeaders,
    );
    return response.statusCode != 200 ? response.statusCode : response.body;
  }

  // Future setData(int newTemp) async {
  //   http.Response response = await http.post(
  //     dataUrl,
  //     headers: dataHeaders,
  //     body: '{"Cella 1 Set": $newTemp}',
  //   );
  //   if (response.statusCode != 200)
  //     return NetworkData(null, response.statusCode);
  //   else
  //     return NetworkData(jsonDecode(response.body), response.statusCode);
  // }
}
