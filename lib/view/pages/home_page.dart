import 'package:flutter/material.dart';
import 'package:logintask/base_widget.dart';
import 'package:logintask/common/router.dart';
import 'package:logintask/presenter/home_presenter.dart';
import 'package:logintask/view/pages/app_details.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePresenter presenter = HomePresenter();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomePresenter>(
        onModelReady: (model) async => await model.getAppList(),
        model: HomePresenter(homeService: Provider.of(context)),
        builder: (context, model, child) => WillPopScope(
              onWillPop: () async => true,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xff003c6c),
                  centerTitle: true,
                  title: Text('Tartlabs Store'),
                ),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        accountName: Text(
                          "Ramkumar",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        accountEmail: Text(
                          "interview@tartlabs.com",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            "R",
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('asset/splash.png'),
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.home),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        title: Text('Home'),
                        onTap: () {
                          model.getAppList();
                          Navigator.pushReplacementNamed(
                              context, RoutePaths.HomePage);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.power_settings_new),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        title: Text('LogOut'),
                        onTap: () => alertDialog(context),

                        // model.logOut();
                        // Navigator.pushReplacementNamed(
                        //     context, RoutePaths.Login);
                      ),
                    ],
                  ),
                ),
                body: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: !model.isLoading
                          ? ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: model.apps.apps.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 100.0,
                                  width: 100.0,
                                  child: Card(
                                    elevation: 0,
                                    child: ListTile(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                logoUrl: model
                                                    .apps.apps[index].appLogo,
                                                appname: model
                                                    .apps.apps[index].appName,
                                                appdescription: model.apps
                                                    .apps[index].appDescription,
                                                appcreatedon: model
                                                    .apps.apps[index].createdAt,
                                              ),
                                            ),
                                          );
                                        },
                                        trailing:
                                            Icon(Icons.keyboard_arrow_right),
                                        leading: Image(
                                          image: NetworkImage(
                                              model.apps.apps[index].appLogo),
                                        ),
                                        subtitle: Text(
                                            'created ${model.apps.apps[index].createdAt}'),
                                        title: Text(
                                            '${model.apps.apps[index].appName}')),
                                  ),
                                );
                              })
                          : CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ));
  }

  void alertDialog(BuildContext context) {
    var alert = AlertDialog(
      title: Text("LogOut"),
      content: Text("Are you sure you want to logout?"),
      actions: <Widget>[
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            presenter.logOut();
            Navigator.pushReplacementNamed(
              context,
              RoutePaths.Login,
            );
          },
        ),
        FlatButton(
          child: Text('No'),
          onPressed: () => Navigator.pop(context, false),
        ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
