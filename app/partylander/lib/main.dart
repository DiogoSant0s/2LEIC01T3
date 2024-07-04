import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:partylander/entities/event.dart';
import 'package:partylander/entities/host.dart';
import 'package:partylander/services/auth.dart';
import 'package:partylander/view/LoginPageWidget.dart';

import 'package:partylander/view/HomePageWidget.dart';
import 'package:partylander/view/EventPageWidget.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/home': (context) => const HomePageWidget(),
      '/event': (context) => EventPageWidget(
            event: Event(
                name: 'dum',
                startDate: DateTime.now(),
                endDate: DateTime.now(),
                location: 'dum',
                description: 'dum',
                type: 'dum',
                host: Host(username: 'dum', location: 'dum', email: 'email')),
          ),
    },
    home: (Auth().user == null) ? const LoginPageWidget() : const HomePageWidget(),
  ));
}
