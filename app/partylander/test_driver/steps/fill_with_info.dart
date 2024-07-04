import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric tapButtonNTimesStep() {
  return when2<String, String, FlutterWorld>(
    'I fill the {string} field with {string}',
        (field, text, context) async {
      final locator = find.byValueKey(field);
        await FlutterDriverUtils.enterText(context.world.driver, locator, text);
    },
  );
}