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

// class BottomNavBar extends StatefulWidget {
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 0;
//   PageController _pageController;

//   @override
//   void initState() {
//     _pageController = PageController(initialPage: 0);
//     super.initState();
//   }

//   void _onPageChanged(index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Center(child: _buildPageView()),
//       bottomNavigationBar: SalomonBottomBar(
//         currentIndex: _selectedIndex,
//         onTap: (index) => setState(() {
//           _onPageChanged(index);
//           _pageController.animateToPage(_selectedIndex,
//               duration: Duration(milliseconds: 200),
//               curve: Curves.fastOutSlowIn);
//         }),
//         items: [
//           SalomonBottomBarItem(
//             icon: Icon(UniconsLine.estate),
//             title: Text("Home"),
//             selectedColor: primarySwatchColor,
//           ),
//           SalomonBottomBarItem(
//             icon: Icon(UniconsLine.book_open),
//             title: Text("Quran"),
//             selectedColor: Colors.green,
//           ),
//           SalomonBottomBarItem(
//             icon: Icon(UniconsLine.notebooks),
//             title: Text("Course"),
//             selectedColor: Colors.orange,
//           ),
//           SalomonBottomBarItem(
//             icon: Icon(UniconsLine.compass),
//             title: Text("Qiblah"),
//             selectedColor: Colors.teal,
//           ),
//           SalomonBottomBarItem(
//             icon: Icon(UniconsLine.ellipsis_v),
//             title: Text("More"),
//             selectedColor: Colors.blueGrey,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPageView() {
//     return PageView(
//       controller: _pageController,
//       onPageChanged: (index) => _onPageChanged(index),
//       children: <Widget>[
//         HomePage(),
//         QuranReading(),
//         Courses(),
//         QiblahCompass(),
//         More()
//       ],
//     );
//   }
// }
