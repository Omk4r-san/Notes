import 'package:flutter/material.dart';
import 'package:notes/shared/styles.dart';
import 'package:notes/widgets/flat_button.dart';
import 'package:unicons/unicons.dart';

class NoteDetails extends StatelessWidget {
  const NoteDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: labelColor),
          elevation: 0,
          backgroundColor: backgroundColor,
          title: Text(
            "Details",
            style: titlelabelStyle.copyWith(fontSize: 25),
          ),
        ),
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                child: Text(
                  "Title of the Note",
                  style: titlelabelStyle.copyWith(fontSize: 22),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: fillColor),
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          UniconsLine.bookmark,
                          size: 35,
                          color: primarySwatchColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: subtitlelabelStyle,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              FlatButtonHelper(text: "Delete")
            ],
          ),
        ));
  }
}
