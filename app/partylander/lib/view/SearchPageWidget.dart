import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partylander/entities/event.dart';
import 'package:partylander/entities/host.dart';
import 'package:partylander/services/DatabaseHandler.dart';
import 'package:partylander/view/EventPageWidget.dart';

class CustomSearchDelegate extends SearchDelegate {

  final DatabaseHandler _dbHandler = DatabaseHandler();

  /*
  List events = [
    Event(
        name: 'feupcaffe',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        location: 'dum',
        description: 'dum',
        type: 'dum',
        host: Host(username: 'dum', location: 'dum')),
    Event(
        name: 'iseploung',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        location: 'dum1',
        description: 'dum1',
        type: 'dum1',
        host: Host(username: 'dum1', location: 'dum1')),
    Event(
        name: 'iscape',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        location: 'dum2',
        description: 'dum2',
        type: 'dum2',
        host: Host(username: 'dum2', location: 'dum2')),
    Event(
        name: 'fcupcenas',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        location: 'dum2',
        description: 'dum2',
        type: 'dum2',
        host: Host(username: 'dum2', location: 'dum2')),
    //Host(username: 'AEFEUP', location: 'Porto')
  ];

   */

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query='';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    return FutureBuilder<List<QueryDocumentSnapshot>>(
      future: _dbHandler.fetchEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final events = snapshot.data ?? [];

        List<QueryDocumentSnapshot> eventMatches = [];

        for(var event in events){
          if(event['name'].toLowerCase().contains(query.toLowerCase()) ||
              event['location'].toLowerCase().contains(query.toLowerCase())){
            eventMatches.add(event);
          }
        }

        return FutureBuilder<List<QueryDocumentSnapshot>>(
          future: _dbHandler.fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            final users = snapshot.data ?? [];

            List<QueryDocumentSnapshot> hostMatches = users.where((user) {
              return user['username'].toLowerCase().contains(query.toLowerCase()) &&
                  user['type'] == 'host';
            }).toList();

            List<Widget> resultList = [];

            for (var event in eventMatches) {
              resultList.add(ListTile(
                title: Text(event['name']),
                subtitle: const Text('Event'),
              ));
            }

            for (var host in hostMatches) {
              resultList.add(ListTile(
                title: Text(host['username']),
                subtitle: const Text('Host'),
              ));
            }

            return ListView(
              children: resultList,
            );
          },
        );
      },
    );

/*
    List matchQuery = [];
    for (var event in events) {
      if(event.name.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(event);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result.name),
          );
        },
    );

 */
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<QueryDocumentSnapshot>>(
      future: _dbHandler.fetchEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final events = snapshot.data ?? [];

        List<QueryDocumentSnapshot> eventMatches = [];

        for(var event in events){
          if(event['name'].toLowerCase().contains(query.toLowerCase()) ||
              event['location'].toLowerCase().contains(query.toLowerCase()) ||
              event['type'].toLowerCase().contains(query.toLowerCase())){
            eventMatches.add(event);
          }
        }

        return FutureBuilder<List<QueryDocumentSnapshot>>(
          future: _dbHandler.fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            final users = snapshot.data ?? [];

            List<QueryDocumentSnapshot> hostMatches = [];

            for(var user in users){
              if(user['type'] == 'host'){
                if(user['username'].toLowerCase().contains(query.toLowerCase()) ||
                    user['location'].toLowerCase().contains(query.toLowerCase())){
                  hostMatches.add(user);
                }
              }
            }

            List<Widget> resultList = [];

            for (var event in eventMatches) {
              Event eventInstance = Event(name: event['name'], startDate: DateTime.parse(event['startDate']),
                  endDate: DateTime.parse(event['endDate']), location: event['location'], description: event['description'],
                  type: event['type'], host: Host(username: 'dum', location: event['location'], email: 'email'));

              resultList.add(
                GestureDetector(
                  onTap: () {
                    // Handle the event tap and navigate to the event page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventPageWidget(event: eventInstance),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(event['name']),
                    subtitle: const Text('Event'),
                  ),
                ),
              );
            }

            for (var host in hostMatches) {
              resultList.add(ListTile(
                title: Text(host['username']),
                subtitle: const Text('Host'),
              ));
            }

            return ListView(
              children: resultList,
            );
          },
        );
      },
    );
  }

  //appearance
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        brightness: Brightness.dark
    );
  }



}