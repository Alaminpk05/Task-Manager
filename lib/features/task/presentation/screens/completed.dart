import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/features/task/bloc/task/task_bloc.dart';
import 'package:taskmanager/features/task/presentation/widgets/tasklist.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../bloc/task/task_state.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
            body: Column(
          children: [
            Center(
                child: Chip(
                    label: '${state.completedTasks.length} Task'.text.make())),
            Tasklist(tasks: state.completedTasks)
          ],
        ));
      },
    );
  }
}
