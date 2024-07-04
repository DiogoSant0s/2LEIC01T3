import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:partylander/view/LoginPageWidget.dart';

void main(){
  testWidgets("Logging in leads to Following Page", (WidgetTester tester) async{
    final findFP = find.byKey(const ValueKey("FollowingPage"));
    final signInButton = find.text('Login');

    await tester.pumpWidget(const LoginPageWidget());
    await tester.tap(signInButton);
    await tester.pump();

    expect(findFP, findsOneWidget);
  });
}