import 'package:flutter/cupertino.dart';
import 'package:provider_state_management/Database/database_helper.dart';
import 'package:provider_state_management/Models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class ScreenProvider extends ChangeNotifier {
  DatabaseHelper helperDB = new DatabaseHelper();
  List<Task> taskListAll;
  List<Task> taskListComplete;
  List<Task> taskListInComplete;
  int countAll = 0;
  int countComplete = 0;
  int countInComplete = 0;

  void saveTaskProv(String taskNamee, int doneVale) async {
    await helperDB.insertTask(Task(taskNamee, doneVale));
    notifyListeners();
  }

// update list view functions
  void updateListVAll() {
    final Future<Database> dbF = helperDB.initialDatabase();
    dbF.then((valueDB) {
      Future<List<Task>> taskk = helperDB.getAllTasksList();
      taskk.then((valueList) {
        this.taskListAll = valueList;
        this.countAll = valueList.length;
        notifyListeners();
      });
    });
  }

  void updateListVComplete() {
    final Future<Database> dbF = helperDB.initialDatabase();
    dbF.then((valueDB) {
      Future<List<Task>> taskk = helperDB.getTaskListComplete();
      taskk.then((valueList) {
        this.taskListComplete = valueList;
        this.countComplete = valueList.length;
        notifyListeners();
      });
    });
  }

  void updateListVInCompete() {
    final Future<Database> dbF = helperDB.initialDatabase();
    dbF.then((valueDB) {
      Future<List<Task>> taskk = helperDB.getTaskListInComplete();
      taskk.then((valueList) {
        this.taskListInComplete = valueList;
        this.countInComplete = valueList.length;
      });
    });
    notifyListeners();
  }

  //end update functions view

  bool isDoneValue(int value) {
    switch (value) {
      case 1:
        return true;
        break;
      case 0:
        return false;
        break;
    }
    notifyListeners();
  }

  bool isDoneValueComplete(int value) {
    switch (value) {
      case 1:
        return true;
        break;
      case 0:
        return false;
        break;
    }
    notifyListeners();
  }

  bool isDoneValueInComplete(int value) {
    switch (value) {
      case 1:
        return true;
        break;
      case 0:
        return false;
        break;
    }
    notifyListeners();
  }

//delete functions
  void deleteTaskAll(BuildContext con, Task tasks) async {
    int resault = await helperDB.deleteTask(tasks.id);
    if (resault != 0) {
      updateListVAll();
      notifyListeners();
    }
  }

  void deleteTaskComplete(BuildContext con, Task tasks) async {
    int resault = await helperDB.deleteTask(tasks.id);
    if (resault != 0) {
      updateListVComplete();
      notifyListeners();
    }
  }

  void deleteTaskInComlete(BuildContext con, Task tasks) async {
    int resault = await helperDB.deleteTask(tasks.id);
    if (resault != 0) {
      updateListVInCompete();
      notifyListeners();
    }
  }

// update functions all pages
  void updateT(Task task) async {
    int resault;
    resault = await helperDB.updateTask(task);

    if (resault == 0) {
      print("task not saved");
    } else {
      print('task  has been saved successfully');
    }
    notifyListeners();
  }

  void updateTComplete(Task task) async {
    int resault;
    resault = await helperDB.updateTask(task);

    if (resault == 0) {
      print("task not saved");
    } else {
      print('task  has been saved successfully');
    }
    notifyListeners();
  }

  void updateTInComplete(Task task) async {
    int resault;
    resault = await helperDB.updateTask(task);

    if (resault == 0) {
      print("task not saved");
    } else {
      print('task  has been saved successfully');
    }
    notifyListeners();
  }
}
