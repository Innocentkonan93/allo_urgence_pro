import 'dart:convert';
import 'dart:developer';

import 'package:allo_urgence_pro/app/modules/auth/models/urgence_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../utils/constants.dart';

class ApiService {
  Future<UrgenceModel?> registerUrgence(UrgenceModel urgence) async {
    try {
      var url = Uri.parse(ApiConstants.apiUrl + ApiConstants.registerEndPoint);
      Response response = await http.post(url, body: {
        'id_urgentiste': urgence.idUrgentiste,
        'email_urgentiste': urgence.emailUrgentiste,
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        UrgenceModel urgenceModel = UrgenceModel.fromMap(body['data']);

        return urgenceModel;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  Future<UrgenceModel?> updateUrgence(UrgenceModel urgence) async {
    try {
      var url = Uri.parse(
        ApiConstants.apiUrl + ApiConstants.updateUrgenceEndPoint,
      );
      Response response = await http.post(
        url,
        body: urgence.toJson(),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        UrgenceModel urgenceModel = UrgenceModel.fromMap(body['data']);
        print(urgenceModel);
        return urgenceModel;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  Future<UrgenceModel?> getUrgence(String idUrgentiste) async {
    try {
      var url = Uri.parse(
          "${ApiConstants.apiUrl}${ApiConstants.allUrgencesEndPoint}/$idUrgentiste");
      Response response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        UrgenceModel urgenceModel = UrgenceModel.fromMap(body);
        print(urgenceModel);
        return urgenceModel;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  Future<List<String>?> searchPlace(String query) async {
    Map<String, String>? headers = {};
    List<String> predictions = [];

    Uri uri = Uri.parse(
      "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=${ApiConstants.placeApiKey}",
    );

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        List preds = body['predictions'];
        for (var element in preds) {
          predictions.add(element['description']);
        }
        return predictions;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
