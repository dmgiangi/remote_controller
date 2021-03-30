import 'package:remote_controller/utilities/thinger_constant.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future getDevices() async {
    http.Response response = await http.get(
      devicesUrl,
      headers: dataHeaders,
    );
    print(response.body);
    return response.statusCode == 200 ?
      response.body
      : response.statusCode;
  }



  //final Uri dataUrl = Uri.https(thingerURL, thingerCellaPath);
  // Future getData() async {
  //   http.Response response = await http.post(
  //     dataUrl,
  //     headers: dataHeaders,
  //   );
  //   print(dataUrl);
  //   print(response.body);
  //   if (response.statusCode != 200)
  //     return response.statusCode;
  //   else
  //     return jsonDecode(response.body);
  // }
  //
  // Future getStatus() async {
  //   http.Response response = await http.get(
  //     statusUrl,
  //     headers: dataHeaders,
  //   );
  //   print(statusUrl);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body)['connected'];
  //   } else
  //     return response.statusCode;
  // }
  //
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