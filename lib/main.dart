import 'package:flutter/material.dart';
import 'package:logintask/common/constants.dart';
import 'package:logintask/common/router.dart';
import 'package:logintask/provider_setup.dart';
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
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: RoutePaths.SplashScreen,
          onGenerateRoute: Router.generateRoute,
        ));
  }
}
