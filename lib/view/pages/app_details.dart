import 'package:flutter/material.dart';
import 'package:logintask/base_widget.dart';
import 'package:logintask/presenter/home_presenter.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String logoUrl;
  final String appname;
  final String appdescription;
  final String appcreatedon;
  DetailScreen(
      {this.logoUrl, this.appname, this.appcreatedon, this.appdescription});
  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return BaseWidget<HomePresenter>(
      onModelReady: (model) async => await model.getAppList(),
      model: HomePresenter(homeService: Provider.of(context)),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(appname),
          backgroundColor: Color(0xff003c6c),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
              ),
              Image(
                fit: BoxFit.cover,
                image: NetworkImage(logoUrl),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'App Description: $appdescription',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'App Created On: $appcreatedon',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.0,
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xffdf4c4f),
                child: MaterialButton(
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {},
                  child: Text(
                    'Install',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
