import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'screens/translator_screen.dart';
import 'screens/translator_view_pager_screen.dart';
import 'utilities/Strings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Colors.pink,
          primaryColorLight: Colors.pink[300],
          accentColor: Colors.pinkAccent[100],
          textTheme: TextTheme(
              headline: TextStyle(color: Colors.white, fontSize: 18),
              display1: TextStyle(color: Colors.black, fontSize: 18),
              button: TextStyle(color: Colors.white, fontSize: 15))),
      home: SplashScreen(), // This is the start widget
      routes: {
        //This is the translated,( English / Selected Language) Screen
        TranslatorViewPagerScreen.routeName: (ctx) =>
            TranslatorViewPagerScreen(),
        TranslatorScreen.routeName: (ctx) => TranslatorScreen()
      },
    );
  }
}
