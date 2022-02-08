import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/repository/auth_repository.dart';

part 'log_in_state.dart';

@Injectable()
class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this._authRepository) : super(LogInInitial());

  final AuthRepository _authRepository;

  Future<void> onSignInWithGoogle() async {
    try {
      await _authRepository.signInWithGoogle();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<void> onAnonymousSignIn() async {
    try {
      await _authRepository.anonymousSignIn();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
