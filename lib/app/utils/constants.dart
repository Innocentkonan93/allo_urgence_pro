import 'dart:io';

import 'package:flutter/foundation.dart';

String newRequestsTopic = "newRequests";

class ApiConstants {
  static String devBaseUrl = Platform.isAndroid
      ? "http://10.0.2.2:8000/api"
      : "http://127.0.0.1:8000/api";

  static String prodBaseUrl = "https://api.allodocteurplus.com/api";

  static String apiUrl = kDebugMode ? devBaseUrl : prodBaseUrl;

  static String registerEndPoint = "/registerUrgence";

  static String updateUrgenceEndPoint = "/updateUrgence";

  static String allUrgencesEndPoint = "/allUrgences";

  static String placeApiKey = "AIzaSyBHjFhoa0BBcHeSpiOjycb4D47raoXm_zQ";

  static String introductionKey = "intro";
}
