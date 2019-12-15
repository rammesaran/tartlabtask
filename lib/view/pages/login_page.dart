import 'package:flutter/material.dart';
import 'package:logintask/common/router.dart';
import 'package:logintask/common/validation.dart';
import 'package:logintask/models/login_request_model.dart';
import 'package:logintask/presenter/login_presenter.dart';
import 'package:provider/provider.dart';
import '../../base_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginRequestModel _loginRequestModel = LoginRequestModel();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginPresenter>(
        model: LoginPresenter(loginService: Provider.of(context)),
        builder: (context, model, child) => Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                backgroundColor: Color(0xff003c6c),
                title: Text('Sign In'),
              ),
              body: Center(
                child: Form(
                  key: _formKey,
                  autovalidate: true,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 150.0,
                                child: Image.asset(
                                  "asset/splash.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 48.0,
                              ),
                              TextFormField(
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                validator: FormValidate().validateUsername,
                                onSaved: (_value) =>
                                    _loginRequestModel.username = _value,
                              ),
                              SizedBox(
                                height: 24.0,
                              ),
                              TextFormField(
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        model.passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: model.setPasswordVisible),
                                  prefixIcon: Icon(Icons.lock),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  hintText: "password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                onSaved: (_value) =>
                                    _loginRequestModel.password = _value,
                                obscureText: model.passwordVisible,
                                validator: FormValidate().validatePassword,
                              ),
                              SizedBox(
                                height: 36.0,
                              ),
                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(30.0),
                                color: Color(0xffdf4c4f),
                                child: MaterialButton(
                                  minWidth: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  onPressed: () async {
                                    final FormState form =
                                        _formKey.currentState;
                                    if (!form.validate()) {
                                    } else {
                                      form.save();
                                      model.request = _loginRequestModel;
                                      await model.login(model.request);
                                      if (model.isLoginSuccess) {
                                        Navigator.pushNamed(
                                          context,
                                          RoutePaths.HomePage,
                                        );
                                      } else {
                                        SnackBar snackBar = SnackBar(
                                            content:
                                                Text(model.error.toString()));
                                        _scaffoldKey.currentState
                                            .showSnackBar(snackBar);
                                      }
                                    }
                                  },
                                  child: Text(
                                    'Sign In',
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
                    ),
                  ),
                ),
              ),
            ));
  }
}
