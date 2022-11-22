import 'package:flutter/material.dart';
import 'package:flutter_provider_task/models/todo.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> todo = [
    Task('Create provider', isComplete: true),
    Task('Create router'),
  ];

  void addTask(String text) {
    todo.add(Task(text));

    // to inform the watch method to update it
    notifyListeners();
  }

  void changeComplete(Task task) {
    // Same code with same result

    // if (task.isComplete == true) {
    //   task.isComplete = false;
    // } else {
    //   task.isComplete = true;
    // }

    task.isComplete = !task.isComplete;
    notifyListeners();
    // task.isComplete = task.isComplete? false : true;
  }

  void deleteTask(Task task) {
    todo.remove(task);
    notifyListeners();
  }
}
