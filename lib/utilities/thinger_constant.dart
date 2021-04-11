import 'dart:io';

const tgrURL = 'backend.thinger.io';
const tgrResourcePathStart = '/v3/users/giangig/devices/';
const tgrResourcePathEnd = '/resources/cella';
const SetDataPathStart = '/v2/users/giangig/devices/';
const tgrSetDataPathEnd = '/cella';
const tgrDevicePath = '/v1/users/giangig/devices';
const token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJjZWxsYV9ncmFmZmlvIiwidXNyIjoiZ2lhbmdpZyJ9.1r928gj_Dcr7mh_OcF_J0jzbsxhcQv1nCLTB6K_RtQ0';
const Map<String, String> dataHeaders = {
  HttpHeaders.contentTypeHeader: "application/json",
  HttpHeaders.authorizationHeader: "Bearer $token",
};
const Map<String, String> statusHeaders = {
  HttpHeaders.authorizationHeader: token,
};

final Uri devicesUrl = Uri.https(tgrURL, tgrDevicePath);
