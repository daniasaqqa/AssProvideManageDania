import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Database/screen_provider.dart';
import 'package:provider_state_management/Models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class AllTasks extends StatefulWidget {
  Task task;
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  Task updateTask;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<ScreenProvider>(builder: (context, value, child) {
      value.updateListVAll();
      return ListView.builder(
          itemCount: value.countAll,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: GestureDetector(
                  child: Icon(Icons.delete, color: Colors.black54),
                  onTap: () {
                    value.deleteTaskAll(context, value.taskListAll[position]);
                  },
                ),
                trailing: Checkbox(
                  //   activeColor: Colors.purple,
                  value: value.isDoneValue(
                    value.taskListAll[position].isDone,
                  ),
                  onChanged: (newvalue) {
                    updateTask = value.taskListAll[position];
                    int changeValue = newvalue == true ? 1 : 0;
                    updateTask.isDone = changeValue;
                    setState(() {
                      value.updateT(updateTask);
                    });
                  },
                ),
                title: Text(value.taskListAll[position].taskName),
              ),
            );
          });
    }));
  }
}
