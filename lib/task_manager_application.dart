import 'package:flutter/material.dart';
import 'package:taskmanager/new_task_screen.dart';
import 'package:taskmanager/routes/new_task_route.dart';
import 'package:taskmanager/routes/task_list_route.dart';
import 'package:taskmanager/task_list_screen.dart';

class TaskManagerApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      initialRoute: TaskListRoute.routeName,
      routes: {
        TaskListRoute.routeName: (context) => TaskListScreen(),
        NewTaskRoute.routeName: (context) => NewTaskScreen()
      },
    );
  }
}
