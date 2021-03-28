import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/note_details.dart';
import 'package:notes/services/crud.dart';
import 'package:notes/shared/styles.dart';
import 'package:unicons/unicons.dart';

class NotePage extends StatefulWidget {
  final String title;
  final IconData trailingIcon;
  const NotePage({Key key, this.trailingIcon, this.title}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  CrudMethods crudObj = new CrudMethods();
  Stream note;
  @override
  void initState() {
    crudObj.getData().then((result) {
      setState(() {
        note = result;
      });
    });
    super.initState();
  }

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
          child: noteList()),
    );
  }

  Widget noteList() {
    return StreamBuilder(
      stream: note,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: fillColor),
                  child: ListTile(
                    onTap: () {
                      if (widget.trailingIcon == UniconsLine.angle_right_b) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NoteDetails(
                                      title: snapshot.data.documents[index]
                                          .data['noteTitle'],
                                      noteDetail: snapshot.data.documents[index]
                                          .data['noteDescription'],
                                      noteId: snapshot
                                          .data.documents[index].documentID,
                                    )));
                      }
                    },
                    leading: Icon(UniconsLine.pen),
                    title: Text(
                      snapshot.data.documents[index].data['noteTitle'],
                      style: titlelabelStyle,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        if (widget.trailingIcon == UniconsLine.angle_right_b) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoteDetails(
                                        title: snapshot.data.documents[index]
                                            .data['noteTitle'],
                                        noteDetail: snapshot
                                            .data
                                            .documents[index]
                                            .data['noteDescription'],
                                        noteId: snapshot
                                            .data.documents[index].documentID,
                                      )));
                        }
                      },
                      icon: Icon(widget.trailingIcon),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
