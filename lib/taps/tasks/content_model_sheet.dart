import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunday_project_todo/modal/modal.dart';
import 'package:sunday_project_todo/utels/deal_with_firebase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/provider.dart';

class ContentModalSheet extends StatefulWidget {
  @override
  State<ContentModalSheet> createState() => _ContentModalSheetState();
}

class _ContentModalSheetState extends State<ContentModalSheet> {
  String title='';
  String description='';
  DateTime newdate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Container(

      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom ,left: 20,right: 20,top: 20),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: pro.neTheme==ThemeMode.light?Colors.white:Color(0xff141922),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) )
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.add_new_task,style: Theme.of(context).textTheme.headline3,),
            SizedBox(height: 10,),
            TextField(
              autofocus: true,
              style: TextStyle(
                  color: pro.neTheme==ThemeMode.light?Colors.black:Colors.white
              ),
              onChanged: (val)=>title=val,
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.title,style: Theme.of(context).textTheme.headline4,)
              ),
            ),
            TextField(
              style: TextStyle(
                color: pro.neTheme==ThemeMode.light?Colors.black:Colors.white
              ),
              onChanged: (value){
                description=value;
              },
              maxLines: 3,
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.description,style: Theme.of(context).textTheme.headline4)
              ),
            ),
            InkWell(
                onTap: (){
                  viedatebaker();
                },
                child: Text(AppLocalizations.of(context)!.select_time,style: Theme.of(context).textTheme.headline5,)),
            Text('${newdate.year}/${newdate.month}/${newdate.day}',textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              ///todo : add to fire base
              TaskModel tas=TaskModel(title: title, description: description, date: DateUtils.dateOnly(newdate).microsecondsSinceEpoch);
              addToFirebase(tas).then((value) {
                Navigator.pop(context);
                print('-------------------------------------------------');
              });
            }
                ,child: Text(AppLocalizations.of(context)!.add_task))
          ],
        ),
      ),
    );
  }

  viedatebaker()async{
     var selcted=await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 20)),
        lastDate: DateTime.now().add(Duration(days: 20)));
     if(selcted==null){
        newdate=newdate;
     }else{
       newdate=selcted;
     }
     setState((){});
  }
}
