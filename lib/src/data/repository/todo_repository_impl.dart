import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/entities/todo/create_todo_data.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/entities/todo/todo.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/repository/todo_repository.dart';

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl extends TodoRepository {
  @override
  Future<void> createTodo(CreateTodoData createTodoData) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getImmediateTodos() {
    // TODO: implement getImmediateTodos
    throw UnimplementedError();
  }

  @override
  Future<Todo> getTodoById(String id) {
    // TODO: implement getTodoById
    throw UnimplementedError();
  }
}
