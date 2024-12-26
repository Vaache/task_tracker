import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/blocs/task_bloc.dart';
import 'package:task/blocs/task_event.dart';

import '../models/task.dart';

class AddTaskDialog {
  static void show(BuildContext context) {
    String title = '';
    String description = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) => title = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) => description = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
                onPressed: () {
                  if (title.isNotEmpty && description.isNotEmpty) {
                    final task = Task(title: title, description: description);
                    context.read<TaskBloc>().add(TaskEventAdded(task));
                    Navigator.of(context).pop();
                  }
                },
                child: Text("add")
            )
          ],
        );
      },
    );
  }
}