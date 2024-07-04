import 'package:partylander/entities/event.dart';
import 'package:partylander/entities/user.dart';

class Host extends User {
  List<Event> futureEvents = [];
  List<Event> pastEvents = [];


  Host({
    required String username,
    String displayName = "",
    required String location,
    required String email,
    pastEvents,
    futureEvents,
  }) : super(
    username: username,
    displayName: displayName,
    location: location,
    email: email,
  );

  addFutureEvent(Event event) {
    futureEvents.add(event);
  }

  addPastEvent(Event event) {
    pastEvents.add(event);
  }

  removeFutureEvent(Event event) {
    futureEvents.remove(event);
  }

  removePastEvent(Event event) {
    pastEvents.remove(event);
  }
}