import 'package:flutter/material.dart';
import 'package:logintask/base_widget.dart';
import 'package:logintask/presenter/home_presenter.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return BaseWidget<HomePresenter>(
      onModelReady: (model) async => await model.getAppList(),
      model: HomePresenter(homeService: Provider.of(context)),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
