import 'package:flutter/cupertino.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric loggedIn() {
  return given<FlutterWorld>(
    'I am logged in',
        (context) async {
      final locator = find.byValueKey(const ValueKey('FollowingPage'));
      await FlutterDriverUtils.isPresent(context.world.driver, locator);
      }
  );
}