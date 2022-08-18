import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunday_project_todo/shared/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sunday_project_todo/shared/theme.dart';

class ChangeThem extends StatefulWidget {
  @override
  State<ChangeThem> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeThem> {
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
                pro.changelanguage('en');
                Navigator.pop(context);
              },
              child: selectedTheme(pro.neLanguage=='en'?true:false,AppLocalizations.of(context)!.english)),
          Divider(color: pro.neTheme==ThemeMode.light?Colors.black:Colors.blue,height: 40),
          InkWell(
              onTap: (){
                pro.changelanguage('ar');
                Navigator.pop(context );
              },
              child: selectedTheme(pro.neLanguage=='ar'?true:false,AppLocalizations.of(context)!.arabic))
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
