import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partylander/services/DatabaseHandler.dart';
import 'package:partylander/view/HomePageWidget.dart';
import 'package:partylander/view/ProfilePageWidget.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarPageWidget extends StatefulWidget {
  const CalendarPageWidget({super.key});

  @override
  State<CalendarPageWidget> createState() => _CalendarPageWidgetState();
}

class _CalendarPageWidgetState extends State<CalendarPageWidget> {
  DateTime selectedDate = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDate = day;
    });
  }

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
                    SizedBox(
                      height: height* .5,
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                        selectedDayPredicate: (day) =>isSameDay(day,selectedDate),
                        onDaySelected: _onDaySelected,
                        availableGestures: AvailableGestures.all,  
                        headerStyle: const HeaderStyle(
                          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                          formatButtonVisible: false,
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(color: Colors.white, fontSize: 16.0),
                          weekendStyle: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        calendarStyle: const CalendarStyle(
                          defaultTextStyle: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(width*.05, height*.0001, width*.05, height*.0001),
                      color: const Color.fromRGBO(61, 61, 61, 1),
                      child: FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
                        future: DatabaseHandler().fetchEventsForDay(selectedDate),
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
                                return Text(
                                    documentSnapshots[index]['name'] + " - " + documentSnapshots[index]['location'] + " - " + documentSnapshots[index]['type'],
                                    style: const TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontWeight: FontWeight.bold),
                                  );
                              },
                            );
                          } else {
                            // Handle the case when no data is available
                            return const Text(
                              'No data available',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.bold));
                          }
                        },
                      ),
                    ),
                  ])),
            ),
          ],
        ),
      ),
    );
  }

}