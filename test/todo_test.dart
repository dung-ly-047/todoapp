// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/controllers/todoController.dart';
import 'package:todoapp/models/todoModel.dart';

void main() {
  test("able to check todo", () {
    var todoController = TodoController();
    todoController.todoList
        .add(TodoModel(name: "Test 01", id: 0, isComplete: false));
    todoController.checkTodo(0, true);
    expect(todoController.todoList[0].isComplete, true);
  });
  test("able to add todo", () {
    var todoController = TodoController();
    var newId = Random().nextInt(10);
    todoController
        .addTodo(TodoModel(name: "Test 01", id: newId, isComplete: false));
    expect(todoController.todoList.last.id, newId);
  });
  test("able to delete todo", () {
    var todoController = TodoController();
    todoController.todoList
        .add(TodoModel(name: "Test 01", id: 0, isComplete: false));
    todoController.deleteTodo(0);
    expect(todoController.todoList.any((element) => element.id == 0), false);
  });
}
