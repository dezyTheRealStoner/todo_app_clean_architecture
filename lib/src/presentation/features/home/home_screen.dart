import 'package:flutter/material.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/base/cubit/cubit_helper.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/features/home/home_cubit.dart';

class HomeScreen extends StatelessWidget
    with CubitHelper<HomeCubit, HomeState> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenSize.width,
              color: Colors.white,
              child: Text(
                'Hello, User',
                style: theme.textTheme.headline4!
                    .copyWith(color: theme.colorScheme.onPrimary),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 25,
                itemBuilder: (context, index) {
                  return Card(
                    child: Text('Todo #$index'),
                  );
                },
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'add todo',
                    style: theme.textTheme.subtitle1,
                  ),
                ),
              ],
            ),
            const Text('select day'),
            ElevatedButton(
              onPressed: () {
                cubit(context)!.onLogOut();
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('logout'),
            ),
          ],
        ),
      ),
    );
  }
}
