import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const signupRoute = "SignUpRoute";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(color: Color(0xffFFFEFE)),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffFFF6F7),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // TODO: sign up
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(color: Color(0xffFFF6F7)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                  color: Color(0xffFFFEFE)),
            ),
          )
        ],
      ),
    );
  }
}
