import 'package:flutter/material.dart';
import 'package:logintask/authentication_presenter.dart';
import 'package:logintask/base_widget.dart';
import 'package:logintask/view/pages/home_page.dart';
import 'package:logintask/view/pages/login_page.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AuthenticationPresenter>(
      model: AuthenticationPresenter(),
      onModelReady: (model) async => await model.hasToken(),
      builder: (context, model, child) =>
          model.isAuthenticated ? HomePage() : LoginPage(),
    );
  }
}
