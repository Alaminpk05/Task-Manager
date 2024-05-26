
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/features/task/bloc/task/task_bloc.dart';
import 'package:taskmanager/features/task/bloc/task/task_state.dart';
import 'package:taskmanager/features/task/data/model/TaskModel.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/tasklist.dart';

class PendingPage extends StatefulWidget {
  const PendingPage({super.key});

  @override
  State<PendingPage> createState() => _PendingPageState();
}

class _PendingPageState extends State<PendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body: BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskModel> tasks = state.pendingTasks;
        return Column(
          children: [
            Center(
                child: Chip(
                    label: '${state.pendingTasks.length} Pending | ${state.completedTasks.length} Completed'
                        .text
                        .make())),
            Tasklist(tasks: tasks),
          ],
        );
      },
    ));
  }
}

