import 'package:flutter/material.dart';

class User {
  final String username;
  String displayName;
  String location = "";
  String email;
  Image profilePicture =  Image.asset('https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png');

  User(
      {
        required this.username,
        this.displayName = "",
        required this.location,
        required this.email,
      });

  setDisplayName (String name) {
    displayName = name;
  }
  setProfilePicture(Image pfp) {
    profilePicture = pfp;
  }
}