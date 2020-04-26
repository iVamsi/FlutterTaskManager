import 'package:flutter/material.dart';
import 'package:taskmanager/routes/new_task_route.dart';

import 'models/Task.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List items = <Task>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Task Manager",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, position) => getRow(position),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewTask,
        child: Icon(
            Icons.add
        ),
      ),
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.yellow,
        elevation: 4.0,
        child: ListTile(
          trailing: InkWell(
            onTap: () {
              print("Tapped on the row $i");
            },
            child: Container(
              height: 25.0,
              width: 25.0,
              color: Colors.greenAccent,
              child: Text(
                "${i+1}"
              ),
              alignment: Alignment.center,
            ),
          ),
          leading: CircleAvatar(
            child: Text(
              "${i+1}"
            ),
          ),
          title: Text(
            "${items[i].title}",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              color: Colors.blue
            ),
          ),
          subtitle: Text(
            "${items[i].description}",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black
            ),
          ),
        ),
      ),
    );
  }

  _createNewTask() async {
    final Task task = await Navigator.of(context).pushNamed(NewTaskRoute.routeName) as Task;
//    final Task task = result as Task;
    setState(() {
      print(task.title);
      print(task.description);
      items.add(task);
    });
  }
}
