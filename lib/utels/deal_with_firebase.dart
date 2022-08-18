import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sunday_project_todo/modal/modal.dart';
  CollectionReference<TaskModel> sendtasktofirebase(){
    return FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
        fromFirestore:(snapshot,op){
          return TaskModel.fromjson(snapshot.data()!);
        },
        toFirestore:(task,snap)=>task.tojson(task) );
  }


Future<void> addToFirebase(TaskModel task){
  var collection=sendtasktofirebase();
  var doc=collection.doc();
  task.id=doc.id;
  return doc.set(task);
}

Stream<QuerySnapshot<TaskModel>> getdatafromfirebase(DateTime dateTime){
    var collection=sendtasktofirebase();
    return collection
        .where('date',isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
        .snapshots();
}

Future<void> deletfromfirebase(TaskModel taskModel){
    var collection=sendtasktofirebase();
   return collection.doc(taskModel.id).delete();
}

void edittasks(TaskModel taskModel){
    var collection=sendtasktofirebase();
    collection.doc(taskModel.id).update({
      'title' : taskModel.title,
      'description' : taskModel.description,
      'date' : taskModel.date,
      'isdone' :taskModel.isdone,
      'id':taskModel.id
    });
}