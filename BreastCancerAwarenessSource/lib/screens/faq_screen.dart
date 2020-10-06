import 'package:breastCancerAwareness/styles/styles.dart';
import 'package:breastCancerAwareness/utilities/Strings.dart';
import 'package:flutter/widgets.dart';

class FAQScreen extends StatelessWidget {
  static const String routeName = "faqroute";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          kKnowMore,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}
