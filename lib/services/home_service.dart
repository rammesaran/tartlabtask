import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:logintask/models/get_app_list_model.dart';
import 'package:logintask/utils/shared_preferences_util.dart';

import '../constants.dart';

class HomeService {
  Future<GetAppListModel> getAppList() async {
    SharedPreferencesUtil prefs = SharedPreferencesUtil();
    final String url = Constants.serverUrl + 'api/v1/client/apps';

    final response = await http.get(
      '$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            "Bearer " + await prefs.getValue("accessToken")
      },
    );

    if (response.statusCode <= 200 || response.statusCode < 400) {
      var result = response.body;

      var responseData = GetAppListModel.fromJson(convert.jsonDecode(result));
      return (responseData);
    } else {
      throw Exception(response.reasonPhrase.toString());
    }
  }
}
