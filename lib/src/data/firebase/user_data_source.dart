import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_acrhitechture/src/utils/custom_logger.dart';

@LazySingleton()
class UserDataSource {
  UserDataSource({required this.id});

  final String id;

  final logger = getLogger('UserDataSource');

  final CollectionReference _profilesCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateProfileData({
    required String name,
    required String image,
  }) async {
    return await _profilesCollection.doc(id).set({
      'name': name,
      'image': image,
    });
  }

  Future<bool> checkUserProfile(String id) async {
    final DocumentSnapshot? snapShot = await _profilesCollection.doc(id).get();

    return snapShot == null || snapShot.exists == false;
  }
}
