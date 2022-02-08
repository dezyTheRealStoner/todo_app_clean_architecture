abstract class AuthRepository {
  Future<void> signInWithGoogle();

  Future<void> anonymousSignIn();

  Future<bool> checkUserLogInState();

  Future<void> logOut();
}
