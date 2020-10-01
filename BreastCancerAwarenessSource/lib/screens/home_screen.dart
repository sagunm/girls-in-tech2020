import 'package:breastCancerAwareness/screens/translator_screen.dart';
import 'package:breastCancerAwareness/utilities/Strings.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kAppName,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MaterialButton(
                color: Theme.of(context).primaryColorLight,
                child: Text(
                  kdocumentTranslator,
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(TranslatorScreen.routeName);
                },
              ),
              MaterialButton(
                color: Theme.of(context).primaryColorLight,
                child: Text(
                  kGlossary,
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {},
              ),
              MaterialButton(
                color: Theme.of(context).primaryColorLight,
                child: Text(
                  kFindADoctor,
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {},
              ),
              MaterialButton(
                color: Theme.of(context).primaryColorLight,
                child: Text(
                  kMyQuestions,
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
