import 'package:equatable/equatable.dart';

class CreateTodoData extends Equatable {
  const CreateTodoData({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.groupTitles,
  });

  final String title;
  final String description;
  final DateTime dateTime;
  final List<String> groupTitles;

  @override
  List<Object?> get props => [
        title,
        description,
        dateTime,
        groupTitles,
      ];

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'groupTitles': groupTitles,
    };
  }

  factory CreateTodoData.fromMap(Map<String, dynamic> map) {
    return CreateTodoData(
      title: map['title'] as String,
      description: map['description'] as String,
      dateTime: map['dateTime'] as DateTime,
      groupTitles: map['groupTitles'] as List<String>,
    );
  }
}
