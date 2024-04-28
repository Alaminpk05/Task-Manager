

import 'package:taskmanager/util/export.dart';


class Tasklist extends StatelessWidget {
  const Tasklist({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
          child: ExpansionPanelList.radio(
            children: tasks
                .map((task) => ExpansionPanelRadio(
                value: task.id,
                headerBuilder: (context, isExpande) => tasktile(task: task,),

                body: ListTile(
                  title: SelectableText.rich(TextSpan(children: [
                    const TextSpan(
                      text: 'Text\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: task.title),
                    const TextSpan(
                      text: '\n\nDescription\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: task.des),
                  ])),
                )))
                .toList(),
          ),
        ));
  }
}




