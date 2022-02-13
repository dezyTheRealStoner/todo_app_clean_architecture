import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:todo_app_clean_acrhitechture/src/data/firebase/profile_data_source.dart';

import 'package:todo_app_clean_acrhitechture/src/utils/logger_utils/custom_logger.dart';

@LazySingleton()
class AuthDataSource {

  AuthDataSource(
    this._firebase,
    this._googleSignIn,
  );

  AuthDataSource(this._firebase);

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

  Future<bool> isUserLogged() async {
    final userId = _firebase.currentUser?.uid;
    logger.i(userId);

    return userId != null || userId != '';
  }

  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
    String image,
  ) async {
    try {
      final firebase.UserCredential result =
          await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      firebase.User? user = result.user;

      await ProfileDataSource(id: user!.uid).setProfileData(
        email: email,
        image: image,
        name: name,
      );
    } on firebase.FirebaseAuthException catch (error) {
      logger.e(error);
    }
  }

  Future<firebase.User?> logInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final firebase.UserCredential result =
        await _firebase.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    firebase.User? user = result.user;
    return user;
  }

  Future<void> signOut() {
    return _firebase.signOut();
  }
}
