import 'package:flutter/material.dart';
import 'package:fx_screener/util/globals.dart' as globals;
import 'package:fx_screener/util/preference_connector.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: const Color(0xFF1C6AFE),
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: const Color(0xff868A9A),
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Color(0xFFF6F8FB),
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  //ThemeData getTheme() =&gt; _themeData;

  ThemeNotifier() {
    print('setting dark theme');
    if (globals.theme == 'DARK') {
      _themeData = darkTheme;
    } else {
      print('setting light theme');
      _themeData = lightTheme;
    }
    notifyListeners();
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    globals.theme = "DARK";
    PreferenceConnector().setString(PreferenceConnector.THEME_SELECTED, "DARK");
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    globals.theme = "LIGHT";
    PreferenceConnector()
        .setString(PreferenceConnector.THEME_SELECTED, "LIGHT");
    notifyListeners();
  }
}
