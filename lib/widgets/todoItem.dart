import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/todoController.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    required this.todoController,
    required this.index,
  }) : super(key: key);

  final TodoController todoController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<TodoController>(
          builder: (controller) => Flexible(
            child: CheckboxListTile(
              title: Text(
                controller.todoList[index].name,
                style: TextStyle(
                    decoration: controller.todoList[index].isComplete!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              value: controller.todoList[index].isComplete,
              onChanged: (val) {
                controller.checkTodo(controller.todoList[index].id, val!);
              },
            ),
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red[300],
            ),
            onPressed: () {
              todoController.deleteTodo(todoController.todoList[index].id);
            })
      ],
    );
  }
}
