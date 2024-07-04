import 'package:flutter_test/flutter_test.dart';
import 'package:partylander/view/EventPageWidget.dart';
import 'package:flutter/widgets.dart';
import 'package:partylander/entities/host.dart';
import 'package:partylander/entities/event.dart';

void main(){
  testWidgets('Following Page renders', (tester) async {
    List<Event> events = [
    Event(
        name: 'dum',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        location: 'dum',
        description: 'dum',
        type: 'dum',
        host: Host(username: 'dum', location: 'dum', email:'email'))];

    await tester.pumpWidget(EventPageWidget(event: events[0]));

    final widgetFinder = find.byKey(const ValueKey("EventPage"));

    expect(widgetFinder, findsOneWidget);
  });
}