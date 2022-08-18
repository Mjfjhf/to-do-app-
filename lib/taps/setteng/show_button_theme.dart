import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunday_project_todo/shared/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sunday_project_todo/shared/theme.dart';

class ChangeTheme extends StatefulWidget {
  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  late var pro;

  @override
  Widget build(BuildContext context) {
    pro=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: (){
                pro.changetheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: selectedTheme(pro.neTheme==ThemeMode.light?true:false,AppLocalizations.of(context)!.light)),
          Divider(color: pro.neTheme==ThemeMode.light?Colors.black:Colors.blue,height: 40),
          InkWell(
              onTap: (){
                pro.changetheme(ThemeMode.dark);
                Navigator.pop(context );
              },
              child: selectedTheme(pro.neTheme==ThemeMode.dark?true:false,AppLocalizations.of(context)!.dark))
        ],
      ),
    );
  }
  Widget selectedTheme(bool selected,String colo){
    if(selected){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(colo,style: Theme.of(context).textTheme.subtitle2?.copyWith(
              color: MyTheme.primarylight
          ),),
          Icon(Icons.done,size: 30,color: MyTheme.primarylight,)
        ],
      );
    }else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(colo,style: Theme.of(context).textTheme.subtitle2,),
          Icon(Icons.done,size: 30,color: Colors.black,)
        ],
      );
    }
  }
}
