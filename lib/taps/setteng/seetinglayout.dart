import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunday_project_todo/taps/setteng/show_buttom_lang.dart';

import '../../shared/provider.dart';
import 'show_button_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class SetteingLayout extends StatefulWidget {
  @override
  State<SetteingLayout> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SetteingLayout> {
  late var pro;
  @override
  Widget build(BuildContext context) {
    pro=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.headline2,),
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black)
            ),
            child: InkWell(
                onTap: (){
                  showButtonLanguge();
                },
                child: Text(pro.neLanguage=='en'?'English':'العربيه',style: Theme.of(context).textTheme.subtitle1,)),
          ),
          SizedBox(height: 30,),
          Divider(color: pro.neTheme==ThemeMode.light?Colors.black:Colors.blue,),
          //////////////////////
          Text(AppLocalizations.of(context)!.theme,style: Theme.of(context).textTheme.headline2,),
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black)
            ),
            child: InkWell(
                onTap: (){
                  showButtonTheme();
                  //setState((){});
                },
                child: Text((pro.neTheme==ThemeMode.light)?(AppLocalizations.of(context)!.light):
                (AppLocalizations.of(context)!.dark),style: Theme.of(context).textTheme.subtitle1,)),
          )
        ],
      ),
    );
  }

  showButtonLanguge(){

    showModalBottomSheet(context: context, builder: (context){
      return ChangeThem();
    },
        backgroundColor: pro.neTheme==ThemeMode.light?Colors.white:Color(0xff141922)
    );
  }
  showButtonTheme(){
    print(pro.neTheme.toString());
    showModalBottomSheet(context: context,
        backgroundColor: pro.neTheme==ThemeMode.light?Colors.white:Color(0xff141922)
        , builder: (context){
      return ChangeTheme();
    });
  }
}
