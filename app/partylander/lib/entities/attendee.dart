//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:partylander/entities/event.dart';
import 'package:partylander/entities/user.dart';

class Attendee extends User {
  List<Event> eventsAttended = [];
  List<Event> eventsAttending = [];
  List<Event> eventsInterestedIn = [];

  Attendee({
    required String username,
    String displayName = "",
    required String location,
    required String email,
    eventsAttended,
    eventsAttending,
    eventsInterestedIn,
  }) : super(
    username: username,
    displayName: displayName,
    location: location,
    email: email,
  );

  addEventAttending(Event event) {
    eventsAttending.add(event);
  }

  addEventInterestedIn(Event event) {
    eventsInterestedIn.add(event);
  }

  removeEventAttending(Event event) {
    eventsAttending.remove(event);
  }

  removeEventInterestedIn(Event event) {
    eventsInterestedIn.remove(event);
  }

  addEventAttended(Event event) {
    eventsAttended.add(event);
  }

  removeEventAttended(Event event) {
    eventsAttended.remove(event);
  }
}