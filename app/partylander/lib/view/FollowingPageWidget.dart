import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partylander/entities/host.dart';
import 'package:partylander/services/DatabaseHandler.dart';
import 'package:partylander/view/cards/EventCard.dart';
import 'package:partylander/entities/event.dart';

class FollowingPageWidget extends StatefulWidget {
  const FollowingPageWidget({super.key});

  @override
  FollowingPageWidgetState createState() => FollowingPageWidgetState();
}

class FollowingPageWidgetState extends State<FollowingPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
  key: const Key("FollowingPage"),
  child: Container(
    color: const Color.fromRGBO(61, 61, 61, 1),
    child: FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
      future: DatabaseHandler().fetchEvents(),
      builder: (BuildContext context, AsyncSnapshot<List<QueryDocumentSnapshot<Object?>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator or placeholder while data is being fetched
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle the error case
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // Data is available, build the ListView using the obtained snapshot data
          List<QueryDocumentSnapshot<Object?>> documentSnapshots = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: documentSnapshots.length,
            itemBuilder: (BuildContext context, int index) {
              return EventCard(
                event: Event (
                  name: documentSnapshots[index]['name'],
                  startDate: DateTime.parse(documentSnapshots[index]['startDate']),
                  endDate: DateTime.parse(documentSnapshots[index]['endDate']),
                  location: documentSnapshots[index]['location'],
                  description: documentSnapshots[index]['description'],
                  type: documentSnapshots[index]['type'],
                  host: Host(username: 'dum', location: 'dum', email: 'email'),
                )
              );
            },
          );
        } else {
          // Handle the case when no data is available
          return const Text('No Events available');
        }
      },
    ),
  ),
);

  }
}
