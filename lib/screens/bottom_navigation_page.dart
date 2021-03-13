import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:notes/screens/add_notes_page.dart';
import 'package:notes/screens/note_details.dart';
import 'package:notes/screens/notes_page.dart';
import 'package:notes/shared/styles.dart';
import 'package:unicons/unicons.dart';

class BottomNavigationPage extends StatefulWidget {
  BottomNavigationPage({Key key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    NotePage(title: "Notes", trailingIcon: UniconsLine.angle_right_b),
    AddNotesPage(),
    NotePage(title: "Notes", trailingIcon: UniconsLine.repeat)
  ];

  onTapFunction() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                  rippleColor: Colors.grey[300],
                  hoverColor: Colors.grey[100],
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100],
                  tabs: [
                    GButton(
                      icon: UniconsLine.list_ul,
                      iconColor: labelColor,
                      iconActiveColor: primarySwatchColor,
                      text: 'Notes',
                      textStyle: subtitlelabelStyle,
                    ),
                    GButton(
                      icon: UniconsLine.plus_square,
                      iconColor: labelColor,
                      iconActiveColor: primarySwatchColor,
                      text: 'Add',
                      textStyle: subtitlelabelStyle,
                    ),
                    GButton(
                      icon: UniconsLine.trash_alt,
                      iconColor: labelColor,
                      iconActiveColor: primarySwatchColor,
                      text: 'Trash',
                      textStyle: subtitlelabelStyle,
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
