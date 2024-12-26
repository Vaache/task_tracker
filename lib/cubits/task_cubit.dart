import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/task.dart';

class TaskCubit extends Cubit<List<Task>> {
  TaskCubit() : super([]);

  void addTask(Task task) {
    final updatedTasks = List<Task>.from(state)..add(task);
    emit(updatedTasks);
  }

  void taskIsCompleted(Task task) {
    final updateTasks = state.map( (t) {
      if (t == task) {
        return Task(
          title: t.title,
          description: t.description,
          isCompleted: true,
        );
      }
      return t;
    }).toList();

    emit(updateTasks);
  }

  void taskIsDeleted(Task task) {
    final updateTasks = state.where((t) => t != task).toList();
    
    emit(updateTasks);
  }
}
