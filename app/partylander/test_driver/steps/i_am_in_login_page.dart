import 'package:flutter/cupertino.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric loggedIn() {
  return given<FlutterWorld>(
      'I am in the Login page',
          (context) async {
        final locator = find.byValueKey(const ValueKey('LoginPage'));
        await FlutterDriverUtils.isPresent(context.world.driver, locator);
      }
  );
}