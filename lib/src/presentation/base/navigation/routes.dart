import 'package:flutter/material.dart';

class Routes {
  static const splash = "/";
  static const login = '/login';
  static const registration = '/registration';
  static const home = '/home';
  static const todos = '/todos';
  static const settings = '/settings';
}

final _routes = <String, Widget Function(BuildContext)>{
  Routes.splash: (context) => const Scaffold(
        body: Center(
          child: Text('BottomNavigationBar'),
        ),
      ),
  Routes.login: (context) => Container(),
  Routes.registration: (context) => Container(),
  Routes.home: (context) => Container(),
  Routes.todos: (context) => Container(),
  Routes.settings: (context) => Container(),
};

Route onGenerateRoute(RouteSettings settings) {
  final builder = _routes[settings.name];
  assert(builder != null, 'Non-existing route was requested');

  return MaterialPageRoute(builder: builder!, settings: settings);
}
