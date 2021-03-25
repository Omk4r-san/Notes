import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notes/screens/bottom_navigation_page.dart';
import 'package:notes/screens/notes_page.dart';
import 'package:notes/screens/regsiter.dart';
import 'package:notes/shared/styles.dart';
import 'package:notes/widgets/flat_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

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
                    'Sign In',
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
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 15.0),
                      fillColor: fillColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: backgroundColor, width: 1.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: backgroundColor, width: 0.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.red)),
                      hintText: "Email",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 15.0),
                      fillColor: fillColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: backgroundColor, width: 1.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: backgroundColor, width: 0.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.red)),
                      hintText: "Password",
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButtonHelper(
                      text: "Sign In",
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavigationPage())),
                    )),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpPage())),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Don\'t have an account ?\n',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: fillColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 14)),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              color: fillColor,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
