import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_acrhitechture/src/utils/logger_utils/custom_logger.dart';

@LazySingleton()
class ProfileDataSource {
  ProfileDataSource({required this.id});

  final String id;

  final logger = getLogger('Database');

  final CollectionReference _profilesCollection =
      FirebaseFirestore.instance.collection('profiles');

  Future<void> setProfileData({
    required String email,
    required String name,
    required String image,
  }) async {
    return await _profilesCollection.doc(id).set({
      'email': email,
      'name': name,
      'image': image,
    });
  }

  Future<bool> checkAvailableUsername(String username) async {
    final DocumentSnapshot? snapShot =
        await _profilesCollection.doc(username).get();

    return snapShot == null || snapShot.exists == false;
  }
}
