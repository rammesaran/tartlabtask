import 'package:logintask/presenter/home_presenter.dart';
import 'package:logintask/presenter/login_presenter.dart';
import 'package:logintask/services/home_service.dart';
import 'package:logintask/services/login_service.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: LoginService()),
  Provider.value(value: HomeService())
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<LoginService, LoginPresenter>(
    builder: (context, service, pre) => LoginPresenter(loginService: service),
  ),
  ProxyProvider<HomeService, HomePresenter>(
    builder: (context, service, pre) => HomePresenter(homeService: service),
  )
];
