import 'package:flutter/material.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/base/cubit/cubit_helper.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/features/splash/splash_cubit.dart';

class SplashScreen extends StatelessWidget
    with CubitHelper<SplashCubit, SplashState> {
  const SplashScreen({Key? key}) : super(key: key);

  static const screenName = '/';

  @override
  Widget build(BuildContext context) {
    cubit(context)!.checkUserLogInState();
    return listen(
      child: const Scaffold(
        body: Center(
          child: Text('splash'),
        ),
      ),
      listener: (context, state) {
        if (state.userIsLogged) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
    );
  }
}
