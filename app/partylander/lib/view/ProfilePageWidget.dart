import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partylander/view/LoginPageWidget.dart';

class ProfilePageWidget extends StatefulWidget {
  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  // Placeholder data
  String displayName = "John Doe";
  String email = "johndoe@example.com";
  int numberOfEventsAttended = 10;
  int numberOfEventsAttending = 5;
  int numberOfEventsInterestedIn = 3;

  bool isEditing = false;
  TextEditingController displayNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayNameController = TextEditingController(text: displayName);
    emailController = TextEditingController(text: email);
  }

  @override
  void dispose() {
    displayNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void saveChanges() {
    setState(() {
      displayName = displayNameController.text;
      email = emailController.text;
      isEditing = false;
    });
  }

  void changeProfilePicture() {
    // Implement the logic to change the profile picture
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginPageWidget(),
      ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(61, 61, 61, 1),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: changeProfilePicture,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('assets/default_pfp.png'),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(61, 61, 61, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 64.0,
              backgroundImage: AssetImage('assets/default_pfp.png'),
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                isEditing ? 'Edit Display Name' : 'Display Name',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            isEditing
                ? TextFormField(
              controller: displayNameController,
              style: TextStyle(color: Colors.white),
            )
                : Text(
              displayName,
              style: TextStyle(fontSize: 18.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                'E-mail',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            isEditing
                ? TextFormField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
            )
                : Text(
              email,
              style: TextStyle(fontSize: 18.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                'Events',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Attended: $numberOfEventsAttended',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              'Attending: $numberOfEventsAttending',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              'Interested in: $numberOfEventsInterestedIn',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: isEditing ? saveChanges : toggleEdit,
                  child: Text(
                    isEditing ? 'Save' : 'Edit',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                if (!isEditing)
                  ElevatedButton(
                    onPressed: logout,
                    child: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}