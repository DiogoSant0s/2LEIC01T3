import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:partylander/entities/event.dart';
import 'package:partylander/entities/host.dart';
import 'package:partylander/view/HomePageWidget.dart';

class EventPageWidget extends StatefulWidget {
  final Event event;
  const EventPageWidget({super.key, required this.event});
  @override
  EventPageWidgetState createState() => EventPageWidgetState();
}

class EventPageWidgetState extends State<EventPageWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final Host host = widget.event.host;
    final DateTime startDate = widget.event.startDate;
    final day = DateFormat('MMMd').format(startDate);
    final hour = DateFormat('Hm').format(startDate);
    final cost = widget.event.monetization ? 'Paid' : 'Free';
    final location = widget.event.location;
    final description = widget.event.description;
    return Container(
      key: const Key("EventPage"),
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
                          Image.asset(
                            'assets/calendar_icon.png',
                            scale: 4,
                          ),
                          Image.asset(
                            'assets/search_icon.png',
                            scale: 4,
                          ),
                          Expanded(
                            child: MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const HomePageWidget()));
                                },
                                child: Image.asset('assets/partylander.png')),
                          ),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: Image.asset('assets/default_pfp.png'),
                          )
                        ]),
                  ),
                ])),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Image.asset('assets/default_pfp.png'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(host.username,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 15,
                            decoration: TextDecoration.none))
                  ],
                ),
              ),
              CachedNetworkImage(
                  imageUrl: widget.event.descriptivePicture.imageUrl),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                    child: Text(widget.event.name,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 25,
                            decoration: TextDecoration.none))),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/calendar_icon.png',
                            scale: 4,
                          ),
                          const SizedBox(width: 10),
                          Text(day,
                              style: const TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 15,
                                  decoration: TextDecoration.none))
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/clock_part.png',
                            scale: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(hour,
                              style: const TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 15,
                                  decoration: TextDecoration.none))
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/monetization_icon.png',
                            scale: 3,
                          ),
                          const SizedBox(width: 10),
                          Text(cost,
                              style: const TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 15,
                                  decoration: TextDecoration.none))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/location_pin_icon.png',
                    scale: 3,
                  ),
                  const SizedBox(width: 10),
                  Text(location,
                      style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 15,
                          decoration: TextDecoration.none))
                ],
              ),
              SizedBox(
                height: 250,
                width: width - 10,
                child: Text(description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Color.fromRGBO(149, 149, 149, 1),
                      fontSize: 15,
                      decoration: TextDecoration.none,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage('assets/saved_icon.png'),
                      color: Color.fromRGBO(149, 149, 149, 1),
                    ),
                    label: const Text('Going',
                        style: TextStyle(
                            color: Color.fromRGBO(149, 149, 149, 1),
                            fontSize: 15,
                            decoration: TextDecoration.none)),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage('assets/saved_icon_white.png'),
                      color: Color.fromRGBO(149, 149, 149, 1),
                    ),
                    label: const Text('Bookmark',
                        style: TextStyle(
                            color: Color.fromRGBO(149, 149, 149, 1),
                            fontSize: 15,
                            decoration: TextDecoration.none)),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
