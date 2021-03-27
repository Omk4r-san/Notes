import 'package:flutter/material.dart';
import 'package:notes/shared/styles.dart';
import 'package:notes/widgets/flat_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/services/crud.dart';

class AddNotesPage extends StatefulWidget {
  final VoidCallback onButtonPressed;
  const AddNotesPage({Key key, this.onButtonPressed}) : super(key: key);

  @override
  _AddNotesPageState createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  // List note = [];
  // String input = "";
  QuerySnapshot note;
  String _notetitle, _notedescription;

  CrudMethods crudObj = new CrudMethods();

  TextEditingController _titleController = new TextEditingController();
  TextEditingController _noteController = new TextEditingController();
  @override
  void initState() {
    crudObj.getData().then((result) {
      setState(() {
        note = result;
      });
    });
    super.initState();
  }

  // addNote() {
  //   DocumentReference documentReference =
  //       Firestore.instance.collection("Notes").document(input);
  //   // Mapping
  //   Map<String, String> notes = {};
  //   documentReference.setData(notes).whenComplete(() {
  //     print("$input created");
  //   });
  // }

  // deletenote() {}

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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              onChanged: (value) {
                _notetitle = value;
              },
              decoration: inputDecoration.copyWith(hintText: "title"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                _notedescription = value;
              },
              maxLines: 20,
              controller: _noteController,
              decoration: inputDecoration.copyWith(hintText: "Note"),
            ),
          ),
          Container(
              margin: EdgeInsets.all(12),
              height: 3 * 20.0,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(primarySwatchColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: BorderSide(color: primarySwatchColor)))),
                child: Text(
                  "Add note",
                  style: subtitlelabelStyle.copyWith(
                      fontSize: 25, color: backgroundColor),
                ),
                onPressed: () {
                  Map<String, dynamic> noteData = {
                    'noteTitle': this._notetitle,
                    'noteDescription': this._notedescription
                  };
                  crudObj.addTask(noteData).then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                  // note.add({
                  //   "title": _titleController.text.toString(),
                  //   "Note": _noteController.text.toString()
                  // });

                  // print(note);

                  setState(() {
                    _titleController.clear();
                    _noteController.clear();
                  });
                },
              ))
        ],
      ),
    );
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Added"),
            title: Text(
              "Note Added",
              style: titlelabelStyle,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

InputDecoration inputDecoration = InputDecoration(
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
);
