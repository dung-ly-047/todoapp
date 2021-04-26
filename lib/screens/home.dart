import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/controllers/todoController.dart';

class HomeScreen extends StatelessWidget {
  final todoController = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
                        itemBuilder: (context, index) => CheckboxListTile(
                          value: todoController.todoList[index].isComplete,
                          onChanged: (val) {},
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
