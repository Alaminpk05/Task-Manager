
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/features/drawer/presentation/screens/drawer.dart';
import 'package:taskmanager/features/task/presentation/widgets/tasklist.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../task/bloc/task/task_bloc.dart';
import '../../../task/bloc/task/task_state.dart';

class Bin extends StatelessWidget {
  const Bin({super.key});
  static const id="bin";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(title: "Recycle Bin".text.make(),
              actions: [
                PopupMenuButton(itemBuilder: (context) =>
                [
                  PopupMenuItem(
                    onTap: null,
                    child: TextButton.icon(onPressed: () {
                      context.read<TaskBloc>().add(DeleteAllTasks());
                    },
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Delete all task')))
                ]),
              ],
            ),
            body: Column(
              children: [
                Center(child: Chip(label: '${state.removedTasks.length} Task'.text.make())),
                Tasklist(tasks: state.removedTasks)
              ],
            ),
            drawer: const DrawerWidget(),

          ),
        );
      },
    );
  }
}
