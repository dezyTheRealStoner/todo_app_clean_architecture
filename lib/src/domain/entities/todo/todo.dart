import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    this.completed = false,
    required this.groupTitles,
  });

  final String id;
  final String title;
  final String description;
  final DateTime dateTime;
  final bool completed;
  final List<String> groupTitles;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'completed': completed,
      'groupTitles': groupTitles,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      dateTime: map['dateTime'] as DateTime,
      completed: map['completed'] as bool,
      groupTitles: map['groupTitles'] as List<String>,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        dateTime,
        completed,
        groupTitles,
      ];
}
