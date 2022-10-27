import 'package:flutter/material.dart';
import '../util/app_bar.dart';


class PageOne extends StatefulWidget {

  static const String route = '/one';

  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAgeOfGold(context, false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Page One',
            ),
          ],
        ),
      ),
    );
  }
}