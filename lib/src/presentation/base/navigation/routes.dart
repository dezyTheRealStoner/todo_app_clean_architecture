import 'package:flutter/material.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/base/cubit/host_cubit.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/features/login/login_cubit.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/features/login/login_screen.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/features/home/home_cubit.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/features/home/home_screen.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/features/splash/splash_cubit.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/features/splash/splash_screen.dart';

class Routes {
  static const splash = "/";
  static const login = '/login';
  static const registration = '/registration';
  static const home = '/home';
  static const todos = '/todos';
  static const settings = '/settings';
}

final _routes = <String, Widget Function(BuildContext)>{
  Routes.splash: (context) => const HostCubit<SplashCubit>(
        child: SplashScreen(),
      ),
  Routes.login: (context) => const HostCubit<LoginCubit>(
        child: LoginScreen(),
      ),
  Routes.registration: (context) => Container(),
  Routes.home: (context) => const HostCubit<HomeCubit>(
        child: HomeScreen(),
      ),
  Routes.todos: (context) => Container(),
  Routes.settings: (context) => Container(),
};

Route onGenerateRoute(RouteSettings settings) {
  final builder = _routes[settings.name];
  assert(builder != null, 'Non-existing route was requested');

  return MaterialPageRoute(builder: builder!, settings: settings);
}
