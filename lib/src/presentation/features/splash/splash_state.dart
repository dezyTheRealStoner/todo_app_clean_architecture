part of 'splash_cubit.dart';

@immutable
class SplashState extends Equatable {
  const SplashState({this.userIsLogged = false});

  final bool userIsLogged;

  SplashState copyWith({
    bool? userIsLogged,
  }) {
    return SplashState(
      userIsLogged: userIsLogged ?? this.userIsLogged,
    );
  }

  @override
  List<Object?> get props => [userIsLogged];
}
