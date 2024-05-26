import 'package:stylish_bottom_bar/helpers/bottom_bar.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:taskmanager/util/export.dart';

class TabPage extends StatefulWidget {
   const TabPage({super.key});
  static const id='TabScreen';

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
 
  var index=0;
  List<Map<String, dynamic>> pagedetails = [
    {
      'title': 'Pending Task',
      'page': const PendingPage(),
    },
    {
      'title': 'Completed Task',
      'page': const Completed(),
    },
    {
      'title': 'Favourite Task',
      'page': const Favourite(),
    }
  ];



  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
          appBar: AppBar(
            title: Text(
              pagedetails[index]['title'],

            ),
            actions: index==0?[
              IconButton(onPressed: (){
                ModalbottomSheet(context,const Addtask());
              },
                  icon: const Icon(Icons.add))
            ]:null,
          ),
          
          
          body: pagedetails[index]['page'],
          drawer:  const DrawerWidget(),
          
          
          
          floatingActionButton: index == 0
              ? FloatingActionButton(
                 
                  child: const Icon(
                    Icons.add,
                   
                  ),
                  onPressed: () {
                    ModalbottomSheet(context,const Addtask());
                  })
              : null,
          
          
          
           bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  index=value;
                });
              },
              selectedItemColor: Colors.black,
              selectedFontSize: 12.0,
              currentIndex: index,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.incomplete_circle_sharp),
                    label: 'Pending'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.done_all_rounded), label: 'Completed'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_rounded), label: 'Favourite'),
              ]),
        ),

    );
  }}





