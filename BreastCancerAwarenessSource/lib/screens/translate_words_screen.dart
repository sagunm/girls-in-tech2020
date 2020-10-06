import 'package:breastCancerAwareness/styles/styles.dart';
import 'package:breastCancerAwareness/utilities/Strings.dart';
import 'package:flutter/material.dart';

class TranslateQuestions extends StatefulWidget {
  static const String routeName = "routeName";
  @override
  _TranslateQuestionsState createState() => _TranslateQuestionsState();
}

class _TranslateQuestionsState extends State<TranslateQuestions> {
  String question;
  String _translatedQuestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppName),
      ),
      body: Column(
        children: [
          Text(
            kMyQuestions,
            style: largeTextStyle,
          ),
          Container(
            child: TextField(),
          ),
          Container(child: Text("")),
        ],
      ),
    );
  }
}
