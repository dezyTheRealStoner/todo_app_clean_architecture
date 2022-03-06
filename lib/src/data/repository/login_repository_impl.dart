import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_acrhitechture/src/data/firebase/login_data_source.dart';
import 'package:todo_app_clean_acrhitechture/src/data/network/mappers/dio_error_mapper.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/repository/login_repository.dart';

@LazySingleton(as: LoginRepository)
class AuthRepositoryImpl extends LoginRepository {
  AuthRepositoryImpl(
    this._authDataSource,
    this._dioErrorMapper,
  );

  final AuthDataSource _authDataSource;
  final DioErrorMapper _dioErrorMapper;

  @override
  Future<void> logInWithGoogle() async {
    try {
      await _authDataSource.signInWithGoogle();
    } on DioError catch (error) {
      throw _dioErrorMapper.map(error);
    }
  }

  @override
  Future<void> logInWithApple() {
    // TODO: implement logInWithApple
    throw UnimplementedError();
  }

  @override
  Future<void> logInWithFacebook() {
    // TODO: implement logInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<bool> checkUserLogInState() async {
    try {
      final userLogInState = await _authDataSource.checkUserLogInState();

      return userLogInState;
    } on DioError catch (error) {
      throw _dioErrorMapper.map(error);
    }
  }

  @override
  Future<void> logOut() async {
    _authDataSource.signOut();
  }
}
