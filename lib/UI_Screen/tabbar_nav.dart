import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_state_management/UI_Screen/add_new_task.dart';
import 'package:provider_state_management/UI_Screen/all_tasks.dart';
import 'package:provider_state_management/UI_Screen/complete_tasks.dart';
import 'package:provider_state_management/UI_Screen/incomplete_task.dart';

class TabBarNav extends StatefulWidget {
  @override
  _TabBarNavStet createState() => _TabBarNavStet();
}

class _TabBarNavStet extends State<TabBarNav> {
  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: indexx,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Dania m Saqqa 220180608"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "All Task",
                ),
                Tab(
                  text: "Complete Task   ",
                ),
                Tab(
                  text: "In Complete List   ",
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            AllTasks(),
            CompleteTasks(),
            InCompleteTasks(),
          ]),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            foregroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNewTask()),
              );
            },
            child: Icon(
              Icons.add,
              size: 28,
            ),
          ),
        ));
  }
}
