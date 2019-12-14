import 'package:flutter/material.dart';
import 'package:logintask/authentication.dart';
import 'package:logintask/view/pages/home_page.dart';
import 'package:logintask/view/pages/login_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case RoutePaths.HomePage:
        return MaterialPageRoute(builder: (context) => HomePage());
      case RoutePaths.Auth:
        return MaterialPageRoute(builder: (context) => Authentication());

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

class RoutePaths {
  static const String Auth = '/';
  static const String Login = 'login';
  static const String HomePage = 'homePage';
}
