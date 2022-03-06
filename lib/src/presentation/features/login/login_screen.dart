import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/base/cubit/cubit_widget.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/base/localization/locale_keys.g.dart';
import 'package:todo_app_clean_acrhitechture/src/presentation/features/login/login_cubit.dart';

class LoginScreen extends CubitWidget<LoginState, LoginCubit> {
  const LoginScreen({Key? key}) : super(key: key);

  static const screenName = '/login';

  @override
  void onStateChanged(BuildContext context, LoginState state) {
    if (state.loginSuccess == true) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            _buildTitle(context),
            _buildDescription(context),
            _buildSignInButtons(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      LocaleKeys.login.tr(),
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      LocaleKeys.loginDescription.tr(),
      style: Theme.of(context).textTheme.subtitle1,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSignInButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(
          context: context,
          onTap: () => cubit(context).onSignInWithGoogle(),
          title: LocaleKeys.signInWithGoogle.tr(),
          image: 'assets/images/google_logo.svg',
        ),
        const SizedBox(height: 20),
        _buildButton(
          context: context,
          title: LocaleKeys.signInWithApple.tr(),
          image: 'assets/images/apple_logo.svg',
        ),
        const SizedBox(height: 20),
        _buildButton(
          context: context,
          title: LocaleKeys.signInWithFacebook.tr(),
          image: 'assets/images/facebook_logo.svg',
        ),
      ],
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String title,
    required String image,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: const Color.fromRGBO(0, 0, 0, 0.2),
              offset: Offset.fromDirection(2, 9),
            ),
            BoxShadow(
              blurRadius: 3,
              color: const Color.fromRGBO(0, 0, 0, 0.2),
              offset: Offset.fromDirection(-2, -8),
            )
          ],
          color: onTap != null
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.secondaryVariant,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 60,
              child: SizedBox(
                height: 40,
                width: 40,
                child: SvgPicture.asset(image),
              ),
            ),
            Positioned(
              left: 150,
              top: 10,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
