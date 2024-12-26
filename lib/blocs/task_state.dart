import '../models/task.dart';

abstract class TaskState {

}

class TaskInitialState extends TaskState {
  final List<Task> tasks;

  TaskInitialState([this.tasks = const []]);
}


// class TaskState {
//   final TaskStatus status;
//   final String error;
//   TaskState({TaskStatus? status, String? error}) : status =  status ?? TaskStatus.initial, error = error ?? '';
//   factory TaskState.initial() => TaskState(status: TaskStatus.initial, error: '');
//   TaskState copyWith({TaskStatus? status, String? error}) => TaskState(status: status ?? this.status, error: error ?? this.error);
// }
//
// enum TaskStatus {initial, loading}