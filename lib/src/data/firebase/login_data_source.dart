import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:todo_app_clean_acrhitechture/src/data/firebase/user_data_source.dart';
import 'package:todo_app_clean_acrhitechture/src/utils/custom_logger.dart';

const _defaultImage =
    'https://www.mzchr.ru/wp-content/uploads/2021/09/avasite.png';

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

    await UserDataSource(id: googleSignInAccount.email).updateProfileData(
      name: '',
      image: _defaultImage,
    );
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();

    await _firebase.signOut();
  }

  Future<bool> isUserLogged() async {
    final userId = _firebase.currentUser?.uid;
    logger.i(userId);

    return userId != null || userId != '';
  }
}
