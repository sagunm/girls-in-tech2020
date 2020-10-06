import 'package:breastCancerAwareness/screens/saved_questions.dart';
import 'package:breastCancerAwareness/screens/settings_screen.dart';
import 'package:breastCancerAwareness/screens/view_translated_documents.dart';
import 'package:breastCancerAwareness/utilities/Strings.dart';
import 'package:breastCancerAwareness/widgets/home_screen_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreenRoute";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> widgets = [
    HomeScreenWidget(),
    ViewTranslatedDocumentList(),
    SettingsScreen(),
    SavedQuestionsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 20),
            ],
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
              ),
              child: BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  selectedItemColor: Colors.blueGrey[900],
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedLabelStyle: TextStyle(
                      color: Color(0xff4F4F4F),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  unselectedLabelStyle: TextStyle(
                      color: Color(0xff4F4F4F),
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      label: label2,
                      icon: Icon(
                        Icons.home,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    BottomNavigationBarItem(
                        label: label3,
                        icon: Icon(
                          Icons.folder_open_rounded,
                          color: Theme.of(context).primaryColor,
                        )),
                    BottomNavigationBarItem(
                      label: label5,
                      icon: Icon(
                        Icons.settings,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: label4,
                      icon: Icon(
                        Icons.feedback,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ]))),
      body: widgets[_selectedIndex],
    );
  }
}
