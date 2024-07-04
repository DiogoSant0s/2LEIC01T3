import 'package:firebase_auth/firebase_auth.dart';
import 'package:partylander/services/DatabaseHandler.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  

  User? get user => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  String? get currentUserId {
    User? user = _auth.currentUser;
    return (user == null) ? null : user.uid;
  }


  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    String uid = currentUserId!;
    DatabaseHandler().fetchUserData(uid);
  }

  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }
  

}
