import 'package:flutter/material.dart';
import 'package:logintask/models/login_request_model.dart';
import 'package:logintask/models/login_response_model.dart';
import 'package:logintask/services/login_service.dart';
import 'package:logintask/utils/shared_preferences_util.dart';

class LoginPresenter extends ChangeNotifier {
  String error;

  LoginService _loginService;

  LoginPresenter({LoginService loginService}) : _loginService = loginService;

  bool isLoginSuccess;
  LoginRequestModel request;
  LoginResponseModel response;

  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      response = await _loginService.login(request);
      SharedPreferencesUtil prefs = SharedPreferencesUtil();
      await prefs.setValue("accessToken", response.accessToken);
      await prefs.setValue("refreshToken", response.refreshToken);
      isLoginSuccess = true;
    } catch (e) {
      isLoginSuccess = false;
      error = e.toString();
    }
    notifyListeners();
    return response;
  }
}
