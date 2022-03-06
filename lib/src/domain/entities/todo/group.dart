import 'package:equatable/equatable.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/entities/todo/todo.dart';

class Group extends Equatable {
  const Group({
    required this.id,
    required this.title,
    this.todos = const [],
  });

  final String id;
  final String title;
  final List<Todo> todos;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'todos': todos,
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      id: map['id'] as String,
      title: map['title'] as String,
      todos: map['todos'] as List<Todo>,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        todos,
      ];
}
