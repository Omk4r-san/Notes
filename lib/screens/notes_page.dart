import 'package:flutter/material.dart';
import 'package:notes/screens/note_details.dart';
import 'package:notes/shared/styles.dart';
import 'package:unicons/unicons.dart';

class NotePage extends StatelessWidget {
  final String title;
  final IconData trailingIcon;
  const NotePage({Key key, this.trailingIcon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          "Notes",
          style: titlelabelStyle.copyWith(fontSize: 25),
        ),
      ),
      body: Container(
        color: backgroundColor,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: fillColor),
                child: ListTile(
                  onTap: () {
                    if (trailingIcon == UniconsLine.angle_right_b) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoteDetails()));
                    }
                  },
                  leading: Icon(UniconsLine.pen),
                  title: Text(
                    "Title Of The Note",
                    style: titlelabelStyle,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      if (trailingIcon == UniconsLine.angle_right_b) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NoteDetails()));
                      }
                    },
                    icon: Icon(trailingIcon),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
