import '../models/task.dart';

abstract class TaskEvent {

}

class TaskEventAdded extends TaskEvent {
  Task task;

  TaskEventAdded(this.task);
}

class TaskEventCompleted extends TaskEvent {
  Task task;

  TaskEventCompleted(this.task);
}

class TaskEventDeleted extends TaskEvent {
  Task task;

  TaskEventDeleted(this.task);
}
