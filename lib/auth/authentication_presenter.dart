import 'package:flutter/cupertino.dart';
import 'package:logintask/utils/shared_preferences_util.dart';

class AuthenticationPresenter extends ChangeNotifier {
  bool isAuthenticated;

  Future hasToken() async {
    SharedPreferencesUtil prefs = SharedPreferencesUtil();
    var token = await prefs.getValue("accessToken");
    isAuthenticated = (token != null) ? true : false;
    notifyListeners();
  }
}
