import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/features/task/presentation/widgets/tasklist.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../bloc/task/task_bloc.dart';
import '../../bloc/task/task_state.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(

            body: Column(
              children: [
                Center(child: Chip(label: ' ${state.favoriteTasks.length} Task'.text.make())),
                Tasklist(tasks: state.favoriteTasks)
              ],
            ));
      },
    );
  }
}