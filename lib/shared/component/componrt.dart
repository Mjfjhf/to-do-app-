import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';
void sureDelet(
    {required BuildContext context,
      required String message,
      required String name1Action,
      required String name2Action,
      required VoidCallback callAction1,
      required VoidCallback callAction2,
      required Color colordialogtheme
    }){
  showDialog(context:context , builder: (context){
    return AlertDialog(
      backgroundColor: colordialogtheme,
      content: Text(message,style: Theme.of(context).textTheme.headline2,),
      actions: [
        TextButton(onPressed: (){
          callAction1();
        }, child: Text(name1Action)),
        TextButton(onPressed: (){
          callAction2();
        }, child: Text(name2Action)),
      ],
    );
  });
}