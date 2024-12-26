import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/blocs/task_bloc.dart';
import 'package:task/screens/task_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => TaskBloc(),
      child: TaskTracker(),
    ),
  );
}

class TaskTracker extends StatelessWidget {
  const TaskTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const TaskScreen(),

    );
  }
}



