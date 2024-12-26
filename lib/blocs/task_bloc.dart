import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/blocs/task_event.dart';
import 'package:task/blocs/task_state.dart';
import 'package:task/models/task.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitialState()) {
    on<TaskEventAdded>(_onTaskAdded);
    on<TaskEventCompleted>(_onTaskCompleted);
    on<TaskEventDeleted>(_onTaskDeleted);
  }


  void _onTaskAdded(TaskEventAdded event, Emitter<TaskState> emit) {
    final TaskInitialState taskState = state as TaskInitialState;
    emit(TaskInitialState([...taskState.tasks, event.task]));
  }

  void _onTaskCompleted(TaskEventCompleted event, Emitter<TaskState> emit) {
    if (state is TaskInitialState) {
      final updateTasks = (state as TaskInitialState).tasks.map((t) {
        if (t == event.task) {
          return Task(
              title: t.title,
              description: t.description,
              isCompleted: true
          );
        }

        return t;
      }).toList();

      emit(TaskInitialState(updateTasks));
    }
  }

  void _onTaskDeleted(TaskEventDeleted event, Emitter<TaskState> emit) {
    if (state is TaskInitialState) {
      final updateTasks = (state as TaskInitialState).tasks.where((t) => t != event.task).toList();
      emit(TaskInitialState(updateTasks));
    }
  }
}