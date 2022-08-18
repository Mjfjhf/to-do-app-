import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sunday_project_todo/modal/modal.dart';
import 'package:sunday_project_todo/taps/tasks/items_task.dart';
import 'package:sunday_project_todo/utels/deal_with_firebase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskLayout extends StatefulWidget {
  @override
  State<TaskLayout> createState() => _TaskLayoutState();
}

class _TaskLayoutState extends State<TaskLayout> {
  DateTime selecteddate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate:selecteddate,
          firstDate: selecteddate,
          lastDate: selecteddate.add(Duration(days: 300)),
          onDateSelected: (date){
            if(date==null)return;
            selecteddate=date;setState((){});},
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Colors.teal[200],
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.red,
          dotsColor: Color(0xFF333A47),
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en',
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: getdatafromfirebase(selecteddate),
            builder: (context,snapshot){
              List<TaskModel> tasks=snapshot.data?.docs.map((e) => e.data()).toList()??[];
              return ListView.builder(itemBuilder: (context,index){
                return ItemsTask(tasks[index]);
              },itemCount: tasks.length,);
            },
          )
        )
      ],
    );
  }
}
