import 'package:get/get.dart';
import 'package:todoapp/models/todoModel.dart';

class TodoService extends GetConnect {
  static const todoPath =
      'https://my-json-server.typicode.com/dung-ly-047/todoapp';

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
}
