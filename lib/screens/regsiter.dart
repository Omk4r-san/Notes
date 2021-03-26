import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/shared/styles.dart';
import 'package:notes/widgets/flat_button.dart';
import 'package:notes/widgets/text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
                Form(
                  key: _formkey,
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
                        hintText: "Password",
                        validator: (input) {
                          if (input.length < 6) {
                            return 'Please provide a password';
                          }
                        },
                        onSaved: (input) => _password = input,
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButtonHelper(
                        text: "Register",
                        onPressed: () {
                          registerUser();
                          print(_email);
                        })),
              ])))
        ]));
  }

  Future<void> registerUser() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user = result.user;
        user.sendEmailVerification();

        Navigator.of(context).pop();
      } catch (e) {
        print(e.message);
      }
    }
  }
}
