import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
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
            Expanded(
              child: ListView(
                children: [
                  CheckboxListTile(
                    value: false,
                    onChanged: (val) {},
                    title: Text("asdasdasd"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
