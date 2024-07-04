import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:partylander/services/auth.dart';
import 'package:uuid/uuid.dart';

import '../entities/attendee.dart';
import '../entities/host.dart';
import '../entities/user.dart';

class DatabaseHandler {

final FirebaseFirestore _db = FirebaseFirestore.instance;

  String generateRandomId() {
    var uuid = const Uuid();
    return uuid.v4();
  }


  Future<User?> fetchUserData(String uid) async {
    CollectionReference usersCollection = _db.collection('users');

    // Query the collection based on the UID field
    QuerySnapshot usersQuery = await usersCollection.get();

    for (QueryDocumentSnapshot user in usersQuery.docs) {
      if (user.id == uid) {
        return 
        (user['type'] == 'host') ?
          Host(
            username: user['username'],
            displayName: user['displayName'],
            location: user['location'],
            email: user['email']
          )
          :
          Attendee(
            username: user['username'],
            displayName: user['displayName'],
            location: user['location'],
            email: user['email']
          );
      }
    }
    return null;
  }

  Future<List<QueryDocumentSnapshot>> fetchUsers() async {
    QuerySnapshot querySnapshot = await _db
        .collection("users")
        .get();

    return querySnapshot.docs;
}

  Future<List<QueryDocumentSnapshot>> fetchEvents() async {
    QuerySnapshot querySnapshot = await _db
        .collection("events")
        .get();

        return querySnapshot.docs;
  }

    Future<List<QueryDocumentSnapshot>> fetchEventsForDay(DateTime selectedDate) async {
      String formattedDate = selectedDate.toIso8601String().substring(0, 10); // Convert to string in "YYYY-MM-DD" format

    QuerySnapshot querySnapshot = await _db
        .collection("events")
        .where("startDate", isEqualTo: formattedDate)
        .get();

        return querySnapshot.docs;
  }

  Future<List<QueryDocumentSnapshot>?> fetchAttendeeEventData() async {
    String uid = Auth().currentUserId!;
    CollectionReference usersCollection = _db.collection('users');

    // Query the collection based on the UID field
    QuerySnapshot usersQuery = await usersCollection.get();
    
    for (QueryDocumentSnapshot user in usersQuery.docs) {
      if (user['uid'] == uid) {
        return user['attends'];
      }
    }
    return null;
  }

    Future<List<QueryDocumentSnapshot>> fetchEventsInterestedIn() async {
    QuerySnapshot querySnapshot = await _db
        .collection("events")
        .get();

        return querySnapshot.docs;
  }

  Future<void> addEvent(String name, String description, String location, String type, String startDate, String endDate, String host, String picLink) async {
    await _db
        .collection('events')
        .doc(generateRandomId())
        .set({
      'name': name,
      'description': description,
      'location': location,
      'type': type,
      'startDate': startDate,
      'endDate': endDate,
      'host': host,
      'picLink': (picLink == "") ?  'https://st.depositphotos.com/1002111/2556/i/950/depositphotos_25565783-stock-photo-young-party-people.jpg' : picLink,
    });
  }

  Future<void> addHost(String username, String displayName, String email) async {
    await _db
        .collection('users')
        .doc(Auth().currentUserId)
        .set({
          'username': username,
          'displayName': displayName,
          'email': email,
          'type': 'host',
          'futureEvents': [],
          'pastEvents': [],
        });
  }

Future<void> addAttendee(String username, String displayName, String email) async {
    await _db
        .collection('users')
        .doc(Auth().currentUserId)
        .set({
          'username': username,
          'displayName': displayName,
          'email': email,
          'type': 'attendee',
          'eventsInterestedIn': [],
          'eventsAttending': [],
          'eventsAttended': [],
        });
  }

  void listenForEventUpdates() {
    _db
        .collection('events')
        .snapshots()
        .listen((snapshot) {
        //process
    });
  }

  void listenForUserUpdates() {
    _db
        .collection('users')
        .snapshots()
        .listen((snapshot) {
        //process
    });
  }
}
