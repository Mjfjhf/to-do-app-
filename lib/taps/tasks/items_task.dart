
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sunday_project_todo/modal/modal.dart';
import 'package:sunday_project_todo/shared/component/componrt.dart';
import 'package:sunday_project_todo/shared/provider.dart';
import 'package:sunday_project_todo/utels/deal_with_firebase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItemsTask extends StatefulWidget {
  TaskModel task;
  ItemsTask(this.task);

  @override
  State<ItemsTask> createState() => _ItemsTaskState();
}

class _ItemsTaskState extends State<ItemsTask> {
  DateTime datnew=DateTime.now();
  late var pro;
  late var navigator;
  @override
  void didChangeDependencies() {
    navigator = Navigator.of(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
     pro=Provider.of<MyProvider>(context);
    return Slidable(
      //closeOnScroll: true,
      startActionPane: ActionPane(
        extentRatio: 0.5,
        motion: BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context){
              sureDelet(context: context,
                  message: "Are you sure",
                  name1Action: 'OK',
                  name2Action: "Cancle",
                  callAction1: (){
                    deletfromfirebase(widget.task);
                    navigator.pop();
                  },
                  callAction2: (){
                    navigator.pop();
                  },colordialogtheme: pro.neTheme==ThemeMode.light?Colors.white:Colors.black);

            },
            backgroundColor: Colors.red,
            icon: Icons.delete_outline_rounded,
            label: AppLocalizations.of(context)!.delet,
          ),   ///todo:delet from firebase
          SlidableAction(
            onPressed: (context){
              showeditsheet();
            },
            backgroundColor: Colors.blue,
            icon: Icons.edit,
            label: AppLocalizations.of(context)!.edit,
          ),  ///todo:edit tasks
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 115,
        width: 352,
        decoration: BoxDecoration(
          color:pro.neTheme==ThemeMode.light? Colors.white:Color(0xff141922),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17),
              height: 62,width: 4,
              color: widget.task.isdone==true?Colors.red:Colors.blue,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.task.title,style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: widget.task.isdone==true?Colors.red:Colors.blue
                ),),
                Text(widget.task.description,style: Theme.of(context).textTheme.headline2?.copyWith(
                  fontSize: 10
                ),),
                SizedBox(height: 8,),
              ],
            ),
            Spacer(),
            ElevatedButton(onPressed: (){
              if(widget.task.isdone){
                widget.task.isdone=false;  //

              }else{
                widget.task.isdone=true;
              }
              edittasks(widget.task);
              // setState((){});
            },style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(widget.task.isdone==true?Colors.red:Colors.blue)
            ), child: slectedDone(widget.task.isdone),),
            SizedBox(width: 8,)
          ],
        ),
      ),
    );
  }

  void showeditsheet(){
    showDialog(context: context,builder:(context){
      return AlertDialog(
        backgroundColor:pro.neTheme==ThemeMode.light?Colors.white:Color(0xff141922),
        title: Text(AppLocalizations.of(context)!.edit_this_task,style: Theme.of(context).textTheme.headline5,),
        content: Container(
          height: 200,
          width: 25,
          child: Column(
            children: [
              TextField(
                autofocus: true,
                style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration(label: Text(AppLocalizations.of(context)!.edit_title,
                style: Theme.of(context).textTheme.headline4,)),
                onChanged: (value){
                  widget.task.title=value;
                },
              ),
              TextField(
                style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)!.edit_description,style: Theme.of(context).textTheme.headline4)),
                onChanged: (value){
                  widget.task.description=value;
                },
              ),
              SizedBox(height: 10,),
              TextButton(onPressed: (){
                shoedatebaker();
              }, child: Text(AppLocalizations.of(context)!.edit_date))
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text(AppLocalizations.of(context)!.cancle)),
          TextButton(onPressed: (){
            edittasks(widget.task);
            Navigator.pop(context);
          }, child: Text(AppLocalizations.of(context)!.done)),
        ],
      );
    });
  }
  void shoedatebaker()async{
    var date=await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 200)),
        lastDate: DateTime.now().add(Duration(days: 300)));
    if(date==null)return;
    print('--------------');
    //datnew=date;
    widget.task.date=date.microsecondsSinceEpoch;
  }//date edited

  Widget slectedDone(bool done){
    if(done){
      return Text(AppLocalizations.of(context)!.done,style: TextStyle(),);
    }else{
      return Icon(Icons.check);
    }
  }
}
