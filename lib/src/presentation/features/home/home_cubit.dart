import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/repository/login_repository.dart';

part 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._authRepository) : super(const HomeState());

  final LoginRepository _authRepository;

  Future<void> onLogOut() async {
    try {
      _authRepository.logOut();
    } on Exception catch (error) {
      throw Exception(error);
    }
  }
}
