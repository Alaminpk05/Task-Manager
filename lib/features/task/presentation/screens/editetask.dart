import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/features/task/data/model/TaskModel.dart';
import 'package:taskmanager/util/helper/id_generator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../bloc/task/task_bloc.dart';
import '../../bloc/task/task_state.dart';

class Editetask extends StatelessWidget {
  final TaskModel oldtask;
    const Editetask({
    super.key,required this.oldtask
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController oldtitlekController=
    TextEditingController(text:oldtask.title );

    TextEditingController olddesController =
    TextEditingController(text: oldtask.des);

    return Column(
      children: [
        'Edite Task'.text.size(24).semiBold.make(),
        20.heightBox,
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          child: TextField(
            controller: oldtitlekController,
            autofocus: true,
            decoration: InputDecoration(
              label: 'Title'.text.make(),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          child: TextField(
            controller: olddesController,
            autofocus: true,
            maxLines: 5,
            minLines: 3,
            decoration: InputDecoration(
              label: 'Description'.text.make(),
              border: OutlineInputBorder(),
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
                      var editeask=TaskModel(
                          id:GUIDGen.generate() ,
                          title: oldtitlekController.text,
                          des: olddesController.text,
                          date:DateTime.now().toString()
                      );
                      context.read<TaskBloc>().add(EditTask(oldTask: oldtask,
                          newTask: editeask));
                      Navigator.pop(context);
                    },
                    child: 'Add'.text.semiBold.color(Colors.blue).make());
              },
            )
          ],
        )
      ],
    );
  }
}
