import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/repository/login_repository.dart';
import 'package:todo_app_clean_acrhitechture/src/utils/custom_logger.dart';

part 'login_state.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(const LoginState());

  final LoginRepository _authRepository;

  final logger = getLogger('AuthCubit');

  Future<void> onSignInWithGoogle() async {
    try {
      await _authRepository.logInWithGoogle();

      emit(state.copyWith(loginSuccess: true));
    } on Exception catch (e) {
      logger.e(e);
      throw Exception(e);
    }
  }
}
