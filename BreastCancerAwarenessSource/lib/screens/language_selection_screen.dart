import 'package:breastCancerAwareness/models/languages.dart';
import 'package:breastCancerAwareness/providers/auth_provider.dart';
import 'package:breastCancerAwareness/screens/home_screen.dart';
import 'package:breastCancerAwareness/styles/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Language Selection Screen
class LanguageSelectionScreen extends StatefulWidget {
  static const String routeName = "LanguageSelectionScreenRoute";

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  @override
  void initState() {
    super.initState();
    LanguageCode.values.forEach((value) {
      languageCodeDropDown.add(DropdownMenuItem(
        value: value,
        child: Text(languageCodeMap[value]),
      ));
    });
  }

  LanguageCode _selectedValue;

  List<DropdownMenuItem<LanguageCode>> languageCodeDropDown = [];
  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<Auth>(context, listen: false);
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
                    Text(
                      'Language',
                      style: largeTextStyle,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Langage', style: languageSubtitleStyle),
                          Text('Idioma', style: languageSubtitleStyle),
                          Text('भाषा', style: languageSubtitleStyle),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 38, right: 38, top: 20),
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: gradient,
                      ),
                      child: DropdownButtonFormField(
                        autovalidate: true,
                        hint: Text(
                          'Select',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        dropdownColor: Color(0xffFFD3D3),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(5),
                          fillColor: Color(0xffFFD3D3),
                        ),
                        elevation: 12,
                        style:
                            TextStyle(fontSize: 30, color: Color(0xFF333333)),
                        items: languageCodeDropDown,
                        isDense: false,
                        onChanged: (value) async {
                          _selectedValue = value;
                          await auth.selectLanguage(_selectedValue);

                          setState(() async {
                            try {
                              String _languagecode =
                                  _selectedValue.toString().split(".")[1];
                              print(_languagecode);
                              EasyLocalization.of(context).deleteSaveLocale();

                              context.locale = Locale(_languagecode,
                                  languageCodeCountryMap[_selectedValue]);
                            } on Exception catch (e) {
                              print(e.toString());
                            }
                            await Future.delayed(Duration(milliseconds: 2000));
                            Navigator.of(context)
                                .pushNamed(HomeScreen.routeName);
                          });
                        },
                        value: _selectedValue,
                      ),
                    ),
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
