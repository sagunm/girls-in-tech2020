import 'package:breastCancerAwareness/screens/faq_screen.dart';
import 'package:breastCancerAwareness/screens/glossary_screen.dart';
import 'package:breastCancerAwareness/screens/translate_doc_screen.dart';
import 'package:breastCancerAwareness/screens/translate_words_screen.dart';
import 'package:breastCancerAwareness/styles/appIcons.dart';
import 'package:breastCancerAwareness/styles/styles.dart';
import 'package:breastCancerAwareness/utilities/Strings.dart';
import 'package:breastCancerAwareness/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: new BoxDecoration(
            image: new DecorationImage(
          image: AssetImage(gradient_bg),
          fit: BoxFit.fill,
        )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                title,
                style: largeTextStyle,
                textAlign: TextAlign.right,
              ),
              Text(homeScreenSubtitle,
                  textAlign: TextAlign.right, style: subtitleStyle),
              Container(
                margin: EdgeInsets.only(left: 100, top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton(
                      text: kUploadDocument,
                      route: TranslatorScreen.routeName,
                    ),
                    CustomButton(
                      text: kGlossary,
                      route: GlossaryScreen.routeName,
                    ),
                    CustomButton(
                      text: kMyQuestions,
                      route: TranslateQuestions.routeName,
                    ),
                    CustomButton(
                      text: kKnowMore,
                      route: FAQScreen.routeName,
                    )
                  ],
                ),
              )
            ]));
  }
}
