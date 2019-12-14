import 'dart:io';
import 'package:logintask/constants.dart';
import 'package:logintask/models/login_request_model.dart';
import 'package:logintask/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginService {
  Future<LoginResponseModel> login(LoginRequestModel loginRequest) async {
    loginRequest.clientId = Constants.clientId;
    loginRequest.clientSecret = Constants.clientSecret;
    loginRequest.grantType = Constants.grantType;
    loginRequest.providers = Constants.providers;
    final String url = Constants.serverUrl + 'oauth/token';

    var requestData = convert.jsonEncode(loginRequest.toJson());
    final response = await http.post('$url',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: requestData);

    if (response.statusCode <= 200 || response.statusCode < 400) {
      var result = response.body;

      var responseData =
          LoginResponseModel.fromJson(convert.jsonDecode(result));
      return (responseData);
    } else {
      throw Exception(response.reasonPhrase.toString());
    }
  }
}
