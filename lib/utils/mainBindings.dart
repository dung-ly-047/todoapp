import 'package:get/get.dart';
import 'package:todoapp/controllers/todoController.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
  }
}
