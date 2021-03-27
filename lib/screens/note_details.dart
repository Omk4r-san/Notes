import 'package:flutter/material.dart';
import 'package:notes/shared/styles.dart';
import 'package:notes/widgets/flat_button.dart';
import 'package:unicons/unicons.dart';

class NoteDetails extends StatefulWidget {
  final String title, noteDetail;
  const NoteDetails({Key key, this.title, this.noteDetail}) : super(key: key);

  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
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
                  widget.title,
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
                          widget.noteDetail,
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
