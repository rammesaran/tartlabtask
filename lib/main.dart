import 'package:flutter/material.dart';
import 'package:logintask/constants.dart';
import 'package:logintask/provider_setup.dart';
import 'package:logintask/router.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  Constants.setEnviroment(Enviroment.DEV);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: RoutePaths.Auth,
          onGenerateRoute: Router.generateRoute,
        ));
  }
}
