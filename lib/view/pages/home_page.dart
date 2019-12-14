import 'package:flutter/material.dart';
import 'package:logintask/base_widget.dart';
import 'package:logintask/presenter/home_presenter.dart';
import 'package:logintask/view/pages/app_details.dart';
import 'package:provider/provider.dart';
import '../../router.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomePresenter>(
        onModelReady: (model) async => await model.getAppList(),
        model: HomePresenter(homeService: Provider.of(context)),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('App'),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Text("Ramkumar"),
                      accountEmail: Text("interview@tartlabs.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          "R",
                          style: TextStyle(fontSize: 40.0),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
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
                      onTap: () {
                        model.logOut();
                        Navigator.pushReplacementNamed(
                            context, RoutePaths.Login);
                      },
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
                                                DetailScreen(),
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
                                          'Entry ${model.apps.apps[index].appName}')),
                                ),
                              );
                            })
                        : CircularProgressIndicator(),
                  ),
                ),
              ),
            ));
  }
}
