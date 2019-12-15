import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logintask/common/router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushNamed(context, RoutePaths.Auth);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: new Image.asset(
          'asset/splash.png',
          height: 200.0,
          width: 200.0,
          fit: BoxFit.fill,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
