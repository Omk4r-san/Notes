import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/add_notes_page.dart';
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
  PageController pageController;

  // List<Widget> _widgetOptions = <Widget>[
  //   NotePage(title: "Notes", trailingIcon: UniconsLine.angle_right_b),
  //   AddNotesPage(),
  //   NotePage(title: "Notes", trailingIcon: UniconsLine.repeat)
  // ];
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  set onPageChanged(index) => _onPageChanged(index);
  void _onPageChanged(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: subtitlelabelStyle,
          unselectedLabelStyle: titlelabelStyle,
          selectedIconTheme: IconThemeData(color: primarySwatchColor),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.list_ui_alt),
              label: "Notes",
            ),
            BottomNavigationBarItem(
                icon: Icon(UniconsLine.plus_square), label: "Add"),
            BottomNavigationBarItem(
                icon: Icon(UniconsLine.trash), label: "Trash")
          ],
          onTap: (index) => setState(() {
            _onPageChanged(index);
            pageController.animateToPage(_selectedIndex,
                duration: Duration(milliseconds: 200),
                curve: Curves.fastOutSlowIn);
          }),
          selectedItemColor: Colors.blueGrey,
          currentIndex: _selectedIndex,
        ),
        body: PageView(
          controller: pageController,
          children: [
            NotePage(title: "Notes", trailingIcon: UniconsLine.angle_right_b),
            AddNotesPage(onButtonPressed: () => pageController.jumpTo(0)),
            NotePage(title: "Notes", trailingIcon: UniconsLine.repeat)
          ],
          onPageChanged: (index) => _onPageChanged(index),
        ),
      ),
    );
  }
}
