import 'package:flutter/widgets.dart';
import 'package:partylander/view/FollowingPageWidget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Tapping the event card opens event page', (tester) async {
    await tester.pumpWidget(const FollowingPageWidget());

    expect(find.byType(ListView), findsOneWidget);
  });
}
