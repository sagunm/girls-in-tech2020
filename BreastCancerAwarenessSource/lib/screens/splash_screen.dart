import 'package:flutter/material.dart';
import 'package:breastCancerAwareness/utilities/Strings.dart';

import 'home_screen.dart';



//This is the splash screen. It is shown for 5 seconds and the app navigates to the home Screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> _setTimerForSplashScreen() async {
    await Future.delayed(Duration(milliseconds: 5000));
    return true;
  }

  void _navigateToHomeScreen() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    _setTimerForSplashScreen().then((result) {
      if (result) _navigateToHomeScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).accentColor,
        child: Center(
          child: Text(
            kAppName,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),
    );
  }
}
