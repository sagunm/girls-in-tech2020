import 'package:breastCancerAwareness/models/glossary.dart';
import 'package:breastCancerAwareness/styles/styles.dart';
import 'package:breastCancerAwareness/utilities/Strings.dart';
import 'package:flutter/material.dart';

class GlossaryMeaning extends StatefulWidget {
  static const String routeName = "glossaryMeaningroute";

  @override
  _GlossaryMeaningState createState() => _GlossaryMeaningState();
}

class _GlossaryMeaningState extends State<GlossaryMeaning> {
  Glossary glossary = Glossary();
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;

    glossary.term = args["term"];
    glossary.meaning = args["meaning"];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(kAppName),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(glossary.term, style: largeTextStyle),
                Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor)),
                    child: Text(glossary.meaning, style: buttonTextStyle)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
