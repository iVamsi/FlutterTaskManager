import 'package:flutter/material.dart';

import 'models/Task.dart';

class NewTaskScreen extends StatefulWidget {
  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final titleTextFieldController = TextEditingController();
  final descriptionTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create task",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: "Title"),
              controller: titleTextFieldController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: "Description"),
              controller: descriptionTextFieldController,
            ),
          ),
          RaisedButton(
            child: Text(
              "Save task",
              style: TextStyle(
                color: Colors.black
              ),
            ),
            color: Colors.lightGreenAccent,
            onPressed: _saveTask,
          )
        ],
      ),
    );
  }

  void _saveTask() {
    Navigator.of(context).pop(Task(titleTextFieldController.text, descriptionTextFieldController.text));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleTextFieldController.dispose();
    descriptionTextFieldController.dispose();
    super.dispose();
  }
}
