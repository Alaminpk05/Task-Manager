import 'package:taskmanager/util/export.dart';

Future<dynamic> ModalbottomSheet(BuildContext context,Widget widget) async{

  return showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (context){
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: widget,
      ),
    );
  });
}
