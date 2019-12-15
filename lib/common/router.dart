import 'package:flutter/material.dart';
import 'package:logintask/auth/authentication.dart';
import 'package:logintask/view/pages/home_page.dart';
import 'package:logintask/view/pages/login_page.dart';
import 'package:logintask/view/pages/splash_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (context) => LoginPage());
        break;
      case RoutePaths.HomePage:
        return MaterialPageRoute(builder: (context) => HomePage());
        break;
      case RoutePaths.Auth:
        return MaterialPageRoute(builder: (context) => Authentication());
        break;
      case RoutePaths.SplashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
        break;
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
  static const String SplashScreen = 'splashScreen';
}
