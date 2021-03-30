import 'dart:io';

const thingerURL = 'backend.thinger.io';
const thingerResourcePath =
    '/v3/users/giangig/devices/ESP32Graffio/resources/';
const thingerDevicePath = '/v1/users/ESP32Graffio/devices';
const token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJjZWxsYV9ncmFmZmlvIiwidXNyIjoiZ2lhbmdpZyJ9.1r928gj_Dcr7mh_OcF_J0jzbsxhcQv1nCLTB6K_RtQ0';
const Map<String, String> dataHeaders = {
  HttpHeaders.contentTypeHeader: "application/json",
  HttpHeaders.authorizationHeader: "Bearer $token",
};
const Map<String, String> statusHeaders = {
  HttpHeaders.authorizationHeader: token,
};

final Uri devicesUrl = Uri.https(thingerURL, thingerDevicePath);