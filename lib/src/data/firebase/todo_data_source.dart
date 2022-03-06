import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class TodoDataSource {
  final CollectionReference _todosCollection =
      FirebaseFirestore.instance.collection('todos');

  Future<void> updateTodo({
    required String id,
    required String title,
    required String description,
    required DateTime dateTime,
    required bool completed,
    required List<String> groupTitles,
  }) async {
    return await _todosCollection.doc(id).set({
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'completed': completed,
      'groupTitles': groupTitles,
    });
  }
}
