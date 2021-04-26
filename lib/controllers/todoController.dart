import 'package:get/get.dart';
import 'package:todoapp/models/todoModel.dart';
import 'package:todoapp/services/todoServices.dart';

class TodoController extends GetxController {
  var isLoading = false.obs;
  @override
  void onInit() async {
    isLoading.value = true;
    todoList.assignAll(await TodoService().getTodo());
    isLoading.value = false;
    super.onInit();
  }

  var todoList = <TodoModel>[].obs;
}
