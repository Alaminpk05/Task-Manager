import 'package:intl/intl.dart';
import 'package:taskmanager/util/export.dart';


class tasktile extends StatelessWidget {
  TaskModel task;
  tasktile({
    super.key,required this.task
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                task.isfav == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(task.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              decoration: task.isdone!
                                  ? TextDecoration
                                  .lineThrough
                                  : null)),
                      Text(DateFormat()
                          .add_yMMMd()
                          .add_Hms()
                          .format(
                          DateTime.parse(task.date))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isdone,
                onChanged:
                task.isdel == false ? (value) {
                  context.read<TaskBloc>().add(UpdateTask(task: task));
                } : null,
              ),
              Popupbutton(task: task,
                cancelOrDeleteCallback: () {
                task.isdel==true?
                context.read<TaskBloc>().add(DeleteTask(task: task))
                :context.read<TaskBloc>().add(RemoveTask(task: task));
                },
                likeOrDislikeCallback: () {
                context.read<TaskBloc>().add(MarkFavoriteOrUnFavoriteTask(task: task));
                },
                editTaskCallback: () {
                  ModalbottomSheet(context, Editetask(oldtask: task));
                },
                restoreTaskCallback: () {
                context.read<TaskBloc>().add(RestoreTask(task: task));
                },),
            ],
          )
        ],
      ),
    );
  }
}