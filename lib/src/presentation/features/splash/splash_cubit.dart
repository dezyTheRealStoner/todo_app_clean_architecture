import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/repository/auth_repository.dart';
import 'package:todo_app_clean_acrhitechture/src/utils/logger_utils/custom_logger.dart';

part 'splash_state.dart';

@Injectable()
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._authRepository)
      : super(const SplashState(userIsLogged: false));

  final AuthRepository _authRepository;

  final logger = getLogger('SplashCubit');

  Future<void> checkUserLogInState() async {
    try {
      final userLogInState = await _authRepository.checkUserLogInState();

      emit(state.copyWith(userIsLogged: userLogInState));
    } on Exception catch (error) {
      throw Exception(error);
    }
  }
}
