import 'package:flutter/material.dart';
import 'package:breastCancerAwareness/utilities/Strings.dart';


class TranslatedDocumentWidget extends StatelessWidget {
  final List<String> _scannedText;
  TranslatedDocumentWidget(this._scannedText);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            kTranslatedDocument,
            style: Theme.of(context).textTheme.title,
          ),

          
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return Text(_scannedText[i]);
                },
                itemCount: _scannedText.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
