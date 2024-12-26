import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/blocs/task_bloc.dart';
import 'package:task/blocs/task_event.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(task.title),
          subtitle: Text(task.description),
          trailing: _getButtons(context, task.isCompleted, task)
        );
      },
      itemCount: tasks.length,
      separatorBuilder: (context, index) => const Divider(),
    );
  }

  Widget _getButtons(BuildContext context, bool isCompleted, Task task) {
    if (isCompleted) {
         return const Text('Task is completed', style: TextStyle(fontSize: 12, color: Colors.green),);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
        children: [
        IconButton(
            onPressed: () {
              context.read<TaskBloc>().add(TaskEventCompleted(task));
            },
            icon: Icon(Icons.check, color: Colors.green)
        ),
        IconButton(
            onPressed: () {
              context.read<TaskBloc>().add(TaskEventDeleted(task));
            },
            icon: Icon(Icons.delete, color: Colors.red)
        ),
      ]
    );
  }
}
