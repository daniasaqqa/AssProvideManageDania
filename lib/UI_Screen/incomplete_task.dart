import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Database/screen_provider.dart';
import 'package:provider_state_management/Models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class InCompleteTasks extends StatefulWidget {
  @override
  _InCompleteTasksState createState() => _InCompleteTasksState();
}

class _InCompleteTasksState extends State<InCompleteTasks> {
  Task updateTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ScreenProvider>(builder: (context, value, child) {
        value.updateListVInCompete();

        return ListView.builder(
          itemCount: value.countInComplete,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: GestureDetector(
                  child: Icon(Icons.delete, color: Colors.black54),
                  onTap: () {
                    value.deleteTaskInComlete(
                        context, value.taskListInComplete[position]);
                  },
                ),
                trailing: Checkbox(
                  // activeColor: Colors.purple,
                  value: value.isDoneValueInComplete(
                    value.taskListInComplete[position].isDone,
                  ),
                  onChanged: (newvalue) {
                    updateTask = value.taskListInComplete[position];
                    int changeValue = newvalue == true ? 1 : 0;

                    setState(() {
                      updateTask.isDone = changeValue;
                      value.updateTInComplete(updateTask);
                    });
                  },
                ),
                title: Text(value.taskListInComplete[position].taskName),
              ),
            );
          },
        );
      }),
    );
  }
}
