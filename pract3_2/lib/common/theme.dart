import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme = light;
  // late Typography defaultTypography;
  late SharedPreferences prefs;

  ThemeData dark = ThemeData.dark().copyWith();

  ThemeData light = ThemeData.light().copyWith();

  ThemeProvider(bool isDarkTheme) {
    _selectedTheme = isDarkTheme ? dark : light;
  }

  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      await prefs.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  ThemeData get theme => _selectedTheme;

  // Future<void> initTheme() async {
  //   prefs = await SharedPreferences.getInstance().then((prefs) => {
  //     _selectedTheme = prefs.getBool("darkTheme") ?? false ? dark : light;
  //   }, () => {
  //
  //   });
  //   var darkTheme = ;
  //   _selectedTheme = darkTheme ? dark : light;
  // }
}