import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_acrhitechture/src/data/firebase/auth_data_source.dart';
import 'package:todo_app_clean_acrhitechture/src/data/network/mappers/dio_error_mapper.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
    this._authDataSource,
    this._dioErrorMapper,
  );

  final AuthDataSource _authDataSource;
  final DioErrorMapper _dioErrorMapper;

  @override
  Future<void> signInWithGoogle() async {
    try {
      await _authDataSource.signInWithGoogle();
    } on DioError catch (error) {
      throw _dioErrorMapper.map(error);
    }
  }

  @override
  Future<void> anonymousSignIn() async {
    await _authDataSource.anonymousSignIn();
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
