import 'package:flutter/material.dart';
import 'package:logintask/base_widget.dart';
import 'package:logintask/presenter/home_presenter.dart';
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
                    DrawerHeader(
                      child: Text('Drawer Header'),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      title: Text('Home'),
                      onTap: () {},
                    ),
                    ListTile(
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
              body: Center(
                child: !model.isLoading
                    ? ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: model.apps.apps.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            child: Card(
                              elevation: 0,
                              child: ListTile(
                                  trailing: Icon(Icons.forward),
                                  leading: Image(
                                    image: NetworkImage(
                                        model.apps.apps[index].appLogo),
                                  ),
                                  title: Text(
                                      'Entry ${model.apps.apps[index].appName}')),
                            ),
                          );
                        })
                    : CircularProgressIndicator(),
              ),
            ));
  }
}
