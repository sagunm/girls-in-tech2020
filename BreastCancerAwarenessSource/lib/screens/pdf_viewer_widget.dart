import 'package:breastCancerAwareness/utilities/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PdfViewerPage extends StatefulWidget {
  static const String routeName = "pdfViewRoute";

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String path;
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    path = args["path"];
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text(kAppName),
      ),
      path: path,
    );
  }
}