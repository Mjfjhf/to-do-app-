import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunday_project_todo/shared/theme.dart';
import 'package:sunday_project_todo/taps/setteng/seetinglayout.dart';
import 'package:sunday_project_todo/taps/tasks/tasklayout.dart';

import '../shared/provider.dart';
import '../taps/tasks/content_model_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayoutPage extends StatefulWidget {
  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int index=0;
  late var pro;
  @override
  Widget build(BuildContext context) {
    pro=Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: pro.neTheme==ThemeMode.light?Color(0xffDFECDB):Color(0xff060E1E),
      appBar: AppBar(
        title: Text('ToDo App', style: Theme.of(context).textTheme.headline1,),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color:  pro.neTheme==ThemeMode.light?Color(0xffDFECDB):Color(0xff141922),
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (newindex){
            index=newindex;
            setState((){});
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          viewButtonsheet();
        }, //todo: open button sheet
        child: Icon(Icons.add,size: 30,),
      ),
      body: tabs[index],
    );
  }
  List<Widget> tabs=[TaskLayout(),SetteingLayout()];
  void viewButtonsheet(){
    showModalBottomSheet(context: context, builder: (context){
      return ContentModalSheet();
    },isScrollControlled: true,backgroundColor: pro.neTheme==ThemeMode.light?Colors.white:Color(0xff141922));
  }
}


// data: Theme.of(context).copyWith(
// canvasColor: Theme.of(context).primaryColor,
// ),