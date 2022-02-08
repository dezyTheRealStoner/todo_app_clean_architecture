import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_clean_acrhitechture/src/di/di_host.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/base/localization/localization_widget.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/base/navigation/routes.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/base/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(
    const DIHost(
      child: LocalizationWidget(
        child: TodoApp(),
      ),
    ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      title: 'Flutter Demo',
      theme: AppTheme.purpleBlackOrange,
      initialRoute: Routes.splash,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
