import 'package:flutter/material.dart';
import 'package:zwaar/views/contact.dart';
import 'package:zwaar/views/home_page.dart';
import 'package:zwaar/views/team.dart';
import 'package:url_strategy/url_strategy.dart';


void main() {
  setPathUrlStrategy();

  runApp(
      MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          // Define the default font family.
          fontFamily: 'Georgia',
        ),
        initialRoute: '/',
        routes: {
          HomePage.route: (context) => const HomePage(),
          Team.route: (context) => const Team(),
          Contact.route: (context) => const Contact()
        },
      )
  );
}
