import 'package:todo_app_clean_acrhitechture/src/domain/entities/todo/create_todo_data.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/entities/todo/todo.dart';

abstract class TodoRepository {
  Future<void> createTodo(CreateTodoData createTodoData);

  Future<Todo> getTodoById(String id);

  Future<List<Todo>> getImmediateTodos();
}
