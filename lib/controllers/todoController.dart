import 'package:get/get.dart';
import 'package:todoapp/models/todoModel.dart';
import 'package:todoapp/services/todoServices.dart';

class TodoController extends GetxController {
  /* 
  ********************
        VARIABLES
  ******************** 
  */
  var isLoading = false.obs;
  var todoList = <TodoModel>[].obs;

  /* 
  **********************
        INITIALIZATION
  ********************** 
  */
  @override
  void onInit() async {
    isLoading.value = true;
    todoList.assignAll(await TodoService().getTodo());
    isLoading.value = false;
    super.onInit();
  }

  /* 
  **********************
        METHODS
  ********************** 
  */

  void checkTodo(int id, bool isComplete) {
    todoList.firstWhere((element) => element.id == id).isComplete = isComplete;
    update();
  }

  void addTodo(TodoModel todo) {
    TodoService().addTodo(todoList, todo);
  }

  void deleteTodo(int id) {
    TodoService().deleteTodo(todoList, id);
  }
}
