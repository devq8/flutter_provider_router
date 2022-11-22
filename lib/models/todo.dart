class Task {
  String task;
  bool isComplete;
  int priority;

  // Task(String task, bool isComplete)
  //     : task = task,
  //       isComplete = isComplete {}

  Task(this.task, {this.isComplete = false, this.priority = 1});
}
