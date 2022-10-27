import 'package:flutter/material.dart';
import 'package:zwaar/util/hexagon_button.dart';
import '../util/app_bar.dart';
import '../util/hexagon_painter.dart';


class Team extends StatefulWidget {

  static const String route = '/team';

  const Team({Key? key}) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAgeOfGold(context, false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}

class HexagonPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}