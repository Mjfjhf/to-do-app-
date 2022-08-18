import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunday_project_todo/shared/provider.dart';
import 'package:sunday_project_todo/shared/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'layoutpage/layout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context){
        return MyProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      home: LayoutPage(),
      theme: MyTheme.lightmode,
      darkTheme: MyTheme.darkmode,
      themeMode: pro.neTheme,
      locale: Locale(pro.neLanguage),
      debugShowCheckedModeBanner: false,
    );
  }
}
