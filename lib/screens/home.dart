import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/controllers/todoController.dart';
import 'package:todoapp/models/todoModel.dart';
import 'package:todoapp/widgets/todoItem.dart';

class HomeScreen extends StatelessWidget {
  final todoController = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addTodoDialog(context);
        },
        label: Text("Add new todo"),
        icon: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "TodoList",
                style: GoogleFonts.sourceSansPro(
                  color: Colors.green,
                  fontSize: 54,
                ),
              ),
            ),
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
                        itemBuilder: (context, index) => TodoItem(
                          todoController: todoController,
                          index: index,
                        ),
                      ),
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
