import 'package:flutter/material.dart';
import 'package:logintask/models/get_app_list_model.dart';
import 'package:logintask/services/home_service.dart';
import 'package:logintask/utils/shared_preferences_util.dart';

class HomePresenter extends ChangeNotifier {
  String error;
  bool isLoading;
  GetAppListModel apps;
  HomeService homeService;

  HomePresenter({HomeService homeService}) {
    this.homeService = homeService;
  }
  Future getAppList() async {
    isLoading = true;
    notifyListeners();
    try {
      apps = await homeService.getAppList();
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<bool> logOut() async {
    SharedPreferencesUtil prefs = SharedPreferencesUtil();
    await prefs.deleteValue("accessToken");
    return true;
  }
}
