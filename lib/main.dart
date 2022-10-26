import 'package:flutter/material.dart';
import 'package:zwaar/views/home_page.dart';
import 'package:zwaar/views/page_one.dart';

void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          // Define the default font family.
          fontFamily: 'Georgia',
        ),
        initialRoute: '/one',
        routes: {
          HomePage.route: (context) => HomePage(),
          PageOne.route: (context) => PageOne(),
        },
      )
  );
}
