import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Database/database_helper.dart';
import 'package:provider_state_management/Database/screen_provider.dart';
import 'package:provider_state_management/Models/task_model.dart';
import 'package:provider_state_management/UI_Screen/tabbar_nav.dart';

class AddNewTask extends StatefulWidget {
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  DatabaseHelper helperDB = DatabaseHelper();
  String appBarName;
  Task taskk;

  TextEditingController taskNameContr = TextEditingController();
  bool isDoneValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<ScreenProvider>(builder: (context, value, child) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: taskNameContr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Your Task Name...'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isDoneValue,
                        onChanged: (newValue) {
                          setState(() {
                            isDoneValue = newValue;
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RaisedButton(
                      color: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 90.0, vertical: 20.0),
                      textColor: Colors.white,
                      child: const Text(
                        'Add New Task',
                        style: TextStyle(fontSize: 17),
                      ),
                      onPressed: () {
                        value.saveTaskProv(
                            taskNameContr.text, isDoneValue == true ? 1 : 0);
                        setState(() {
                          saveTask();
                        });
                      })
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }

  void saveTask() {
    setState(() {});
    print('Task  saved"');
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TabBarNav()),
    );
  }
}
