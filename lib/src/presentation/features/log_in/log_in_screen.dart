import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/base/cubit/cubit_helper.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/base/localization/locale_keys.g.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/features/log_in/log_in_cubit.dart';

class LogInScreen extends StatelessWidget
    with CubitHelper<LogInCubit, LogInState> {
  const LogInScreen({Key? key}) : super(key: key);

  static const screenName = '/login';

  void signInWithGoogle(BuildContext context) async {
    await cubit(context)!.onSignInWithGoogle();
    Navigator.pushReplacementNamed(context, '/');
  }

  void signInAnonymous(BuildContext context) async {
    await cubit(context)!.onAnonymousSignIn();
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle(context),
              const SizedBox(height: 50),
              _buildDescription(context),
              const SizedBox(height: 30),
              _buildButton(context: context, theme: theme, withGoogle: true),
              const SizedBox(height: 20),
              Text(
                LocaleKeys.or.tr(),
                style: theme.textTheme.bodyText2,
              ),
              const SizedBox(height: 20),
              _buildButton(context: context, theme: theme, withGoogle: false),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {},
                child: Text(LocaleKeys.languageNow.tr()),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      LocaleKeys.signIn.tr(),
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      LocaleKeys.signInDescription.tr(),
      style: Theme.of(context).textTheme.bodyText2,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required ThemeData theme,
    required bool withGoogle,
  }) {
    return InkWell(
      onTap: () =>
          withGoogle ? signInWithGoogle(context) : signInAnonymous(context),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: const Color.fromRGBO(0, 0, 0, 0.2),
              offset: Offset.fromDirection(2, 9),
            )
          ],
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        height: 60,
        child: withGoogle
            ? _buildGoogleSignInButton(context)
            : Center(
                child: Text(
                  LocaleKeys.continueWithOutGoogle.tr(),
                  style: theme.textTheme.subtitle1!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
      ),
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          height: 40,
          width: 40,
          child: Image(image: AssetImage('assets/images/google_image.png')),
        ),
        Text(
          LocaleKeys.signInWithGoogle.tr(),
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ],
    );
  }
}
