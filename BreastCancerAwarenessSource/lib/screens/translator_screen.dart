import 'dart:io';
import 'package:breastCancerAwareness/screens/translator_view_pager_screen.dart';
import 'package:breastCancerAwareness/utilities/Constants.dart';
import 'package:breastCancerAwareness/utilities/Strings.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//This is the translator screen
//User can upload or take picture and translate it to the
class TranslatorScreen extends StatefulWidget {
  static const String routeName = "translatorScreenRoute";

  @override
  _TranslatorScreenState createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  CircularProgressIndicator _progressIndicator;
  File _pickedImage;
  List<String> _convertedLines = [];
  static const String _CAMERA = "CAMERA";
  static const String _GALLERY = "GALLERY";
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _isLoading = false;
  }

  // method used to pickImage either from gallery or camera
  void _pickImage(String selectedOption) async {
    switch (selectedOption) {
      case _CAMERA:
        var tempFile =
            // ignore: invalid_use_of_visible_for_testing_member
            await ImagePicker.platform.pickImage(source: ImageSource.camera);

        _processTempFile(tempFile);
        break;
      case _GALLERY:
        var tempFile =
            // ignore: invalid_use_of_visible_for_testing_member
            await ImagePicker.platform.pickImage(source: ImageSource.gallery);
        _processTempFile(tempFile);
        break;
      default:
        break;
    }
  }

//Method to convert the temporary image to a File format

  void _processTempFile(PickedFile tempFile) {
    setState(() {
      _isLoading = true;
    });

    try {
      if (tempFile != null) {
        _pickedImage = File(tempFile.path);
        _readImage();
      }
    } on Exception catch (e) {
      _isLoading = false;
      print(e);
    }
  }

//Method to recognize the text using the firebase ML Vision api
  void _readImage() async {
    try {
      FirebaseVisionImage fbImage = FirebaseVisionImage.fromFile(_pickedImage);
      TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
      VisionText readText = await textRecognizer.processImage(fbImage);
      _convertedLines = [];
      for (TextBlock block in readText.blocks) {
        String text = "";
        for (TextLine line in block.lines) {
          text += line.text + '\n';
        }

        _convertedLines.add(text);
      }
      _isLoading = false;
      Navigator.pushNamed(context, TranslatorViewPagerScreen.routeName,
          arguments: {
            kImageFile: _pickedImage,
            kScannedTextList: _convertedLines
          });
    } on Exception catch (e) {
      _isLoading = false;
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    _progressIndicator = CircularProgressIndicator(
      backgroundColor: Theme.of(context).accentColor,
      valueColor: new AlwaysStoppedAnimation<Color>(
          Theme.of(context).primaryColorLight),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kAppName,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
      body: Center(
        child: _isLoading
            ? _progressIndicator
            : Container(
                margin: EdgeInsets.all(10),
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      color: Theme.of(context).primaryColorLight,
                      onPressed: () {
                        _pickImage(_GALLERY);
                      },
                      child: Text(
                        kUploadDocument,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    MaterialButton(
                      color: Theme.of(context).primaryColorLight,
                      onPressed: () {
                        _pickImage(_CAMERA);
                      },
                      child: Text(
                        kTakePicture,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ],
                )),
              ),
      ),
    );
  }
}
