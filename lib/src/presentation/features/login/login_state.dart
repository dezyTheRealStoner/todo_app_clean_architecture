part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({this.loginSuccess = false});

  final bool loginSuccess;

  LoginState copyWith({bool? loginSuccess}) {
    return LoginState(
      loginSuccess: loginSuccess ?? this.loginSuccess,
    );
  }

  @override
  List<Object?> get props => [loginSuccess];
}
