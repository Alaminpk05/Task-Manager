


import '../../../../util/export.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Drawer(
            child: Column(children: [
          Container(
              color: Colors.grey,
              width: double.infinity,
              child: const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text(
                  'Task Drawer',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              )),
          20.heightBox,
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const TabPage()));
            },
            child: ListTile(
              leading: const Icon(Icons.folder),
              title: 'My Task'.text.size(16.0).semiBold.make(),
              trailing:
                  '${state.pendingTasks.length}|${state.completedTasks.length}'
                      .text
                      .semiBold
                      .make(),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const Bin()));
            },
            child: ListTile(
              leading: const Icon(Icons.folder),
              title: 'Bin'.text.size(16.0).semiBold.make(),
              trailing: '${state.removedTasks.length}'.text.semiBold.make(),
            ),
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(value: (state.switchvalue), onChanged: (newvalue) {
                if(newvalue==true){
                  context.read<SwitchBloc>().add(SwitchonEvent( ));
                }else{
                  context.read<SwitchBloc>().add(SwitchoffEvent( ));
                }
              });
            },
          )
        ]));
      },
    );
  }
}
