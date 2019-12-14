import 'package:flutter/material.dart';
import 'package:logintask/view/pages/home_page.dart';
import 'package:logintask/view/pages/login_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RoutePaths.HomePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutePaths.Application:
      //   return MaterialPageRoute(builder: (_) => ApplicationPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

class RoutePaths {
  static const String Application = '/';
  static const String Login = 'login';
  static const String HomePage = 'homePage';
}
