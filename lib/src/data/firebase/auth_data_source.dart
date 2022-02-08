import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:todo_app_clean_acrhitechture/src/utils/logger_utils/custom_logger.dart';

@LazySingleton()
class AuthDataSource {
  AuthDataSource(
    this._firebase,
    this._googleSignIn,
  );

  final logger = getLogger('AuthService');

  final firebase.FirebaseAuth _firebase;
  final GoogleSignIn _googleSignIn;

  Future<bool> checkUserLogInState() async {
    final userId = _firebase.currentUser?.uid;
    logger.i(userId);

    return userId != null;
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await _firebase.signInWithCredential(credential);
  }

  Future<void> anonymousSignIn() async {
    await _firebase.signInAnonymously();
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();

    await _firebase.signOut();
  }
}
