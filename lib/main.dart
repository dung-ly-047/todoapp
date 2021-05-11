import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/todo.dart';
import 'package:todoapp/utils/mainBindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      defaultTransition: Transition.fadeIn,
      initialBinding: MainBinding(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("TodoApp"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Full",
                  icon: Icon(Icons.all_inbox),
                ),
                Tab(
                  text: "Completed",
                  icon: Icon(Icons.check),
                ),
                Tab(
                  text: "Incompleted",
                  icon: Icon(Icons.adjust_sharp),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            TodoScreen(),
            TodoScreen(
              isCompleted: true,
            ),
            TodoScreen(
              isCompleted: false,
            ),
          ]),
        ),
      ),
    );
  }
}
