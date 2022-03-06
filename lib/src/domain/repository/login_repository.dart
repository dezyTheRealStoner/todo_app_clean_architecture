abstract class LoginRepository {
  Future<void> logInWithGoogle();

  Future<void> logInWithApple();

  Future<void> logInWithFacebook();

  Future<bool> checkUserLogInState();

  Future<void> logOut();
}
