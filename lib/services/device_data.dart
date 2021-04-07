class DeviceData {
  DeviceData({this.name, this.online, this.description, this.id});
  String id;
  String name;
  String description;
  bool online;
  double readTemperature;
  double setTemperature;
  bool coldRelay;
  bool hotRelay;
  String localIp;
  bool probeFail;
  int requestStatusError;
  int requestDataError;
}
