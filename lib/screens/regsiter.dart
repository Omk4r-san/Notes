import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/shared/styles.dart';
import 'package:notes/widgets/flat_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(children: [
          Positioned(
              child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [primarySwatchColor, Color(0xffA494F0)])),
          )),
          SafeArea(
              child: Center(
                  child: ListView(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Register Your \n   Account',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: fillColor,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w500,
                          fontSize: 35),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButtonHelper(text: "Done", onPressed: () {})),
              ])))
        ]));
  }
}
