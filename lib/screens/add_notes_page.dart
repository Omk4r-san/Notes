import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/shared/styles.dart';
import 'package:notes/widgets/flat_button.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          "Add Your Note",
          style: titlelabelStyle.copyWith(fontSize: 25),
        ),
      )),
      body: Container(
        color: backgroundColor,
        child: ListView(
          children: [
            textField("Title", 3),
            textField("Note", 15),
            FlatButtonHelper(
              text: "Add note",
            )
          ],
        ),
      ),
    );
  }

  Widget textField(String hint, int lines) {
    final int maxLines = lines;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(12),
        height: maxLines * 20.0,
        child: TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: subtitlelabelStyle,
            fillColor: fillColor,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: backgroundColor, width: 1.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: fillColor, width: 0.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}
