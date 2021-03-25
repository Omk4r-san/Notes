import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/screens/bottom_navigation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/screens/regsiter.dart';
import 'package:notes/shared/styles.dart';
import 'package:notes/widgets/flat_button.dart';
import 'package:notes/widgets/text_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    Key key,
  }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email, _password;
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

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
                Form(
                  key: _fromkey,
                  child: Column(
                    children: [
                      TextFormFieldHelper(
                        hintText: "Email",
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Please enter an email';
                          }
                        },
                        onSaved: (input) => _email = input,
                      ),
                      TextFormFieldHelper(
                        obscureText: true,
                        hintText: "Password",
                        validator: (input) {
                          if (input.length < 8) {
                            return 'Please provide password';
                          }
                        },
                        onSaved: (input) => _password = input,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButtonHelper(
                      text: "Sign In",
                      onPressed: () {
                        signIn();
                        print(_email);
                      },
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

  Future<void> signIn() async {
    final fromState = _fromkey.currentState;
    if (fromState.validate()) {
      try {
        fromState.save();
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavigationPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
