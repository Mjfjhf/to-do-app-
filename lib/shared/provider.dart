import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String neLanguage='en';
  ThemeMode neTheme=ThemeMode.light;
  void changetheme(ThemeMode themeMode){
    neTheme=themeMode;
    notifyListeners();
  }
  void changelanguage(String langugae){
    neLanguage=langugae;
    notifyListeners();
  }
}