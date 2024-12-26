import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/blocs/task_bloc.dart';
import 'package:task/blocs/task_state.dart';
import 'package:task/widgets/add_task_dialog.dart';
import 'package:task/widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Tracker'),
        actions: [
          IconButton(
            onPressed: () {
              AddTaskDialog.show(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {

          return TaskList(tasks: (state as TaskInitialState).tasks);
        },
      ),
    );
  }
}