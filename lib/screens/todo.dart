import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/todoController.dart';
import 'package:todoapp/models/todoModel.dart';
import 'package:todoapp/widgets/todoItem.dart';

class TodoScreen extends StatelessWidget {
  final todoController = Get.put(TodoController());
  final bool? isCompleted;

  TodoScreen({Key? key, this.isCompleted}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isCompleted == null
          ? FloatingActionButton.extended(
              onPressed: () {
                addTodoDialog(context);
              },
              label: Text("Add new todo"),
              icon: Icon(Icons.add),
            )
          : SizedBox(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Expanded(
                child: todoController.isLoading.value
                    ? Center(
                        child: CupertinoActivityIndicator(
                          radius: 15.0,
                        ),
                      )
                    : ListView.builder(
                        itemCount: todoController.todoList.length,
                        itemBuilder: (context, index) {
                          if (isCompleted != null && isCompleted == true) {
                            if (todoController.todoList[index].isComplete ==
                                true) {
                              return TodoItem(
                                todoController: todoController,
                                index: index,
                                isCompleted: isCompleted,
                              );
                            }
                          } else if (isCompleted != null &&
                              isCompleted == false) {
                            if (todoController.todoList[index].isComplete ==
                                false) {
                              return TodoItem(
                                todoController: todoController,
                                index: index,
                                isCompleted: isCompleted,
                              );
                            }
                          } else {
                            return TodoItem(
                              todoController: todoController,
                              index: index,
                              isCompleted: isCompleted,
                            );
                          }
                          return SizedBox();
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future addTodoDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (contextDialog) {
        String newTodoName = '';
        return AlertDialog(
          title: Text("Title"),
          content: TextField(
            onChanged: (value) => newTodoName = value,
            decoration: InputDecoration(
              hintText: "Enter a title for todo",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel")),
            TextButton(
                onPressed: () {
                  todoController.addTodo(TodoModel(
                      name: newTodoName,
                      id: Random().nextInt(100),
                      isComplete: false));
                  Get.back();
                },
                child: Text("OK")),
          ],
        );
      },
    );
  }
}
