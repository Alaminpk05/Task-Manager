import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/features/task/data/model/TaskModel.dart';
import 'package:taskmanager/util/helper/id_generator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../bloc/task/task_bloc.dart';
import '../../bloc/task/task_state.dart';

class Addtask extends StatelessWidget {
  const Addtask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController desController = TextEditingController();

    return Column(
      children: [
        'Add Task'.text.size(24).semiBold.make(),
        20.heightBox,
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          child: TextFormField(
            controller: titleController,
            autofocus: true,
            decoration: InputDecoration(
              label: 'Title'.text.make(),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          child: TextFormField(
            controller: desController,
            autofocus: true,
            maxLines: 5,
            minLines: 3,
            validator: (String? value) {
              if (value!.isEmpty) {
                return('Title must be enter');
              }
              return null;
            },
            decoration: InputDecoration(
              label: 'Description'.text.make(),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: 'Cancel'.text.size(18).semiBold.make()),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return TextButton(
                    onPressed: () {
                      var task = TaskModel(
                          id: GUIDGen.generate(),
                          title: titleController.text,
                          des: desController.text,
                          date: DateTime.now().toString());
                      context.read<TaskBloc>().add(AddTask(task: task));
                      Navigator.pop(context);
                    },
                    child: 'Add'.text.semiBold.make());
              },
            )
          ],
        )
      ],
    );
  }
}
