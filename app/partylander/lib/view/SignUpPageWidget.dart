// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partylander/services/DatabaseHandler.dart';
import 'package:partylander/view/LoginPageWidget.dart';

import '../services/auth.dart';
import 'HomePageWidget.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({super.key});

  @override
  SignUpPageWidgetState createState() => SignUpPageWidgetState();
}

class SignUpPageWidgetState extends State<SignUpPageWidget> {
  String? errorMessage;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  bool isHost = false;

  Future<void> signUp() async {
    
    try {
      await Auth().signUp(
        emailController.text,
        passwordController.text,
      );
      (isHost) ? DatabaseHandler().addHost(usernameController.text, displayNameController.text, emailController.text): DatabaseHandler().addAttendee(usernameController.text, displayNameController.text, emailController.text);
      errorMessage = null;
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Material(
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
                        'Create a', 
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
                      Text(
                        'account.', 
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
                            vertical: height * .04
                        ),
                      ),
                      SizedBox(
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
                            vertical: height * .02
                        ),
                      ),
                      SizedBox(
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
                            vertical: height * .02
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                        width: width * 0.6,
                        child: TextField(
                          controller: passwordConfirmationController,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Color.fromRGBO(255, 255, 255, 1),
                          obscureText: true,
                          decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(),
                                  filled: true,
                                  errorText: errorMessage,
                                  fillColor: Color.fromRGBO(255, 255, 255, 1),
                                  hintText: "confirm password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                    ),
                                  hintStyle:
                                    TextStyle(
                                      color: Color.fromRGBO(211, 210, 210, 1),
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
                            vertical: height * .02
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
                          onPressed: ()  {
                            signUp();
                            FirebaseAuth.instance
                              .authStateChanges()
                                .listen((User? user) {
                                  if (user != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  HomePageWidget()),
                                  );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  LoginPageWidget()),
                                  );
                                  }
                                }
                              );
                          },
                          child: Text(
                            'Register', 
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
                              'Register with Google',
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
                              "Already have an account? ", 
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
                                  MaterialPageRoute(builder: (context) => LoginPageWidget()),
                                );
                              },
                              child: Text(
                                'Login!', 
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
