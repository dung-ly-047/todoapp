import 'package:get/get.dart';
import 'package:todoapp/models/todoModel.dart';

class TodoService extends GetConnect {
  /* 
  **********************
        API PATHS
  ********************** 
  */
  static const todoPath =
      'https://mocki.io/v1/1a5ad88e-e424-45d9-885a-e46b788ff8fe';

  /* 
  **********************
        SERVICES
  ********************** 
  */

  Future<List<TodoModel>> getTodo() async {
    try {
      var response = await get(todoPath);
      var listTodo = todoModelFromJson(response.bodyString ?? '[]');
      return listTodo;
    } catch (e) {
      print(e);
    }
    return [];
  }

  void addTodo(List<TodoModel> todoList, TodoModel todo) {
    todoList.add(todo);
  }

  void deleteTodo(List<TodoModel> todoList, int id) {
    todoList.removeWhere((element) => element.id == id);
  }
}
