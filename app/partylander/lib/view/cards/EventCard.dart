import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:partylander/entities/event.dart';
import 'package:partylander/view/EventPageWidget.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 300,
            height: 200,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                image: DecorationImage (
                  image: CachedNetworkImageProvider(event.descriptivePicture.imageUrl),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                border: Border.all(width: 0.5),
                color: const Color.fromRGBO(217, 217, 217, 1),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Color.fromARGB(109, 175, 175, 175),
                    blurRadius: 5,
                    spreadRadius: 2,
                  )
                ]),
            child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EventPageWidget(
                            event: event,
                          )));
                },
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "See More",
                    style: TextStyle(
                      color: Color.fromRGBO(149, 149, 149, 1),
                      fontSize: 13,
                    ),
                  ),
                ))),
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            event.name,
            style: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                decoration: TextDecoration.none,
                fontSize: 16),
          ),
        )
      ],
    );
  }
}
