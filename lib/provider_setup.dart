import 'package:logintask/presenter/login_presenter.dart';
import 'package:logintask/services/login_service.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: LoginService())
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<LoginService, LoginPresenter>(
    builder: (context, service, pre) => LoginPresenter(loginService: service),
  )
];
