import 'package:flutter/material.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/base/cubit/cubit_helper.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/features/home/home_cubit.dart';

class HomeScreen extends StatelessWidget
    with CubitHelper<HomeCubit, HomeState> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('home'),
            ElevatedButton(
              onPressed: () async {
                await cubit(context)!.onLogOut();
                await Future.delayed(const Duration(seconds: 1));
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
