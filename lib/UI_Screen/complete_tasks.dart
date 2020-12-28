import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Database/screen_provider.dart';
import 'package:provider_state_management/Models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class CompleteTasks extends StatefulWidget {
  Task task;
  @override
  _CompleteTasksState createState() => _CompleteTasksState();
}

class _CompleteTasksState extends State<CompleteTasks> {
  Task updateTask;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<ScreenProvider>(builder: (context, value, child) {
      value.updateListVComplete();
      return ListView.builder(
        itemCount: value.countComplete,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: GestureDetector(
                child: Icon(Icons.delete, color: Colors.black54),
                onTap: () {
                  value.deleteTaskComplete(
                      context, value.taskListComplete[position]);
                },
              ),
              trailing: Checkbox(
                // activeColor: Colors.purple,
                value: value.isDoneValueComplete(
                  value.taskListComplete[position].isDone,
                ),
                onChanged: (newvalue) {
                  updateTask = value.taskListComplete[position];
                  int changeValue = newvalue == true ? 1 : 0;
                  updateTask.isDone = changeValue;
                  setState(() {
                    value.updateTComplete(updateTask);
                  });
                },
              ),
              title: Text(value.taskListComplete[position].taskName),
            ),
          );
        },
      );
    }));
  }
}
