// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partylander/entities/host.dart';
import 'package:partylander/services/DatabaseHandler.dart';
import 'package:partylander/view/HomePageWidget.dart';
import 'package:partylander/view/MainPageHostWidget.dart';
import 'package:partylander/services/auth.dart';
import 'package:partylander/view/SignUpPageWidget.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  LoginPageWidgetState createState() => LoginPageWidgetState();
}

class LoginPageWidgetState extends State<LoginPageWidget> {
  String? errorMessage;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    try {
      await Auth().signIn(
        emailController.text,
        passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    int index = 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Material(
      key: Key('LoginPage'),
      child: Container(
        color: const Color.fromRGBO(61, 61, 61, 1),
        child: Column(
          children: [
            Padding
            (
              padding: EdgeInsets.symmetric(
                          horizontal: width * 0.01, vertical: height * .1),
              child: SafeArea(
                child: Container(
                    color: const Color.fromRGBO(61, 61, 61, 1),
                    child: Column(children: <Widget>[
                      Text(
                        'Welcome to', 
                        textAlign: TextAlign.left, 
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Inter',
                          fontSize: 24,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * .01
                        ),
                        child: Image.asset(
                          'assets/partylander_2.png',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * .08
                        ),
                      ),
                      SizedBox(
                        key: Key('email_field'),
                        height: height * 0.04,
                        width: width * 0.6,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: emailController,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Color.fromRGBO(255, 255, 255, 1),
                          decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(),
                                  filled: true,
                                  errorText: errorMessage,
                                  fillColor: Color.fromRGBO(255, 255, 255, 1),
                                  hintText: "email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                    ),
                                  hintStyle:
                                    TextStyle(
                                      color: Color.fromRGBO(211, 210, 210, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 24,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                    ),
                            ), 
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * .02
                        ),
                      ),
                      SizedBox(
                        key: Key('password_field'),
                        height: height * 0.04,
                        width: width * 0.6,
                        child: TextField(
                          controller: passwordController,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Color.fromRGBO(255, 255, 255, 1),
                          obscureText: true,
                          decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(),
                                  filled: true,
                                  errorText: errorMessage,
                                  fillColor: Color.fromRGBO(255, 255, 255, 1),
                                  hintText: "password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                    ),
                                  hintStyle:
                                    TextStyle(
                                      color: Color.fromRGBO(211, 210, 210, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 24,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                    ),
                            ), 
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * .04
                        ),
                      ),
                      Container(
                        height: height * 0.04,
                        width: width * 0.5,
                        decoration: const 
                        BoxDecoration(
                          color: Color.fromRGBO(0, 154, 188, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: TextButton(
                          key: Key('LoginButton'),
                          onPressed: ()  {
                            signIn();
                            if (Auth().user != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  (DatabaseHandler().fetchUserData(Auth().user.toString()).runtimeType == Host) ? MainPageHostWidget(): HomePageWidget()),
                              );
                            }
                          },
                          child: Text(
                            'Login', 
                            textAlign: TextAlign.left, 
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Inter',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * .01
                        ),
                      ),
                      Text(
                        'or',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Inter',
                          fontSize: 15,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * .01
                        ),
                      ),
                      Container(
                        height: height * 0.04,
                        width: width * 0.6,
                        decoration: const 
                        BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/google.png",
                              scale: 80,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                              horizontal: width * .01
                              ),
                            ),
                            Text(
                              'Login with Google',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(211, 210, 210, 1),
                                fontFamily: 'Inter',
                                fontSize: 15,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1
                              ),
                            ),
                          ],
                        ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * .01
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(width*0.05, height*0.05, width*0.05, height*0.05),
                        height: height * 0.04,
                        width: width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ", 
                              textAlign: TextAlign.left, 
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  (SignUpPageWidget())),
                                );
                              },
                              child: Text(
                                'Sign up!', 
                                textAlign: TextAlign.left, 
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 154, 188, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
