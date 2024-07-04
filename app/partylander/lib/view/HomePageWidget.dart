import 'package:flutter/material.dart';
import 'package:partylander/services/DatabaseHandler.dart';
import 'package:partylander/view/CalendarPageWidget.dart';
import 'package:partylander/view/EventPageWidget.dart';
import 'package:partylander/view/FollowingPageWidget.dart';
import 'package:partylander/view/ProfilePageWidget.dart';
import 'package:partylander/entities/event.dart';
import 'package:partylander/entities/host.dart';
import 'package:partylander/entities/user.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  HomePageWidgetState createState() => HomePageWidgetState();
}


class HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        color: const Color.fromRGBO(61, 61, 61, 1),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                  color: const Color.fromRGBO(61, 61, 61, 1),
                  child: Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.01, vertical: height * .01),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: height * 0.05,
                              width: width * 0.13,
                              child: MaterialButton( 
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const CalendarPageWidget()));
                                },
                                child:Image.asset('assets/calendar_icon.png',),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.05,
                              width: width * 0.13,
                              child: GestureDetector(
                                onTap: () {
                                  showSearch(context: context, delegate: CustomSearchDelegate());
                                },
                                child: Image.asset(
                                  'assets/search_icon.png',
                                  scale: 4
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.05,
                              width: width * 0.5,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const HomePageWidget()));
                                },
                                child: Image.asset('assets/partylander.png')),
                            ),
                            const Spacer(),
                            Container(
                              height: height * 0.05,
                              width: width * 0.17,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProfilePageWidget()));
                                  },
                                  child: Image.asset('assets/default_pfp.png')),
                            )
                          ]),
                    ),
                  ])),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'Following',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            const Expanded(child: FollowingPageWidget())
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {

  final DatabaseHandler _dbHandler = DatabaseHandler();

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
              dynamic hostname;
              dynamic hostlocation;
              dynamic hostemail;

              resultList.add(

                  FutureBuilder<User?>(
                      future: _dbHandler.fetchUserData(event['host']),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if(snapshot.hasData){
                          hostname = snapshot.data?.username;
                          hostlocation = snapshot.data?.location;
                          hostemail = snapshot.data?.email;
                        }
                        else{
                          hostname = "Dum";
                        }


                        Event eventInstance = Event(name: event['name'], startDate: DateTime.parse(event['startDate']),
                            endDate: DateTime.parse(event['endDate']), location: event['location'], description: event['description'],
                            type: event['type'], host: Host(username: hostname, location: 'hostlocation', email: 'hostemail'));




                        return GestureDetector(
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
                        );

                      }
                  ));
            }


            for (var host in hostMatches) {

              resultList.add(
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  ProfilePageWidget(),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(host['displayName']),
                    subtitle: const Text('Host'),
                  ),
                )
              );
            }

            return ListView(
              children: resultList,
            );
          },
        );
      },
    );

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
              dynamic hostname;
              dynamic hostlocation;
              dynamic hostemail;

              resultList.add(

                  FutureBuilder<User?>(
                      future: _dbHandler.fetchUserData(event['host']),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if(snapshot.hasData){
                          hostname = snapshot.data?.username;
                          hostlocation = snapshot.data?.location;
                          hostemail = snapshot.data?.email;
                        }
                        else{
                          hostname = "Dum";
                        }


                        Event eventInstance = Event(name: event['name'], startDate: DateTime.parse(event['startDate']),
                            endDate: DateTime.parse(event['endDate']), location: event['location'], description: event['description'],
                            type: event['type'], host: Host(username: hostname, location: 'hostlocation', email: 'hostemail'));




                        return GestureDetector(
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
                        );

                      }
                  ));
            }


            for (var host in hostMatches) {

              resultList.add(
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  ProfilePageWidget(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(host['displayName']),
                      subtitle: const Text('Host'),
                    ),
                  )
              );
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