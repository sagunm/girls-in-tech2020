import 'dart:io';
import 'package:breastCancerAwareness/utilities/Strings.dart';
import 'package:breastCancerAwareness/widgets/original_document_widget.dart';
import 'package:breastCancerAwareness/widgets/translated_document_widget.dart';
import 'package:flutter/material.dart';
import 'package:breastCancerAwareness/utilities/Constants.dart';

class TranslatorViewPagerScreen extends StatefulWidget {
  static const routeName = "TranslatorPageViewScreenRoute";

  @override
  _TranslatorViewPagerScreenState createState() =>
      _TranslatorViewPagerScreenState();
}

class _TranslatorViewPagerScreenState extends State<TranslatorViewPagerScreen> {
  final _controller = PageController(initialPage: 1);
  File _file;
  List<String> _scannedText = [];
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    _file = args[kImageFile];
    _scannedText = args[kScannedTextList];
    final pageView = PageView(
      controller: _controller,
      children: <Widget>[
        OriginalDocumentWidget(_file),
        TranslatedDocumentWidget(_scannedText)
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          kAppName,
        ),
      ),
      body: pageView,
    );
  }
}
