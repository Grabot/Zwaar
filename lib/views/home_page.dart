import 'package:flutter/material.dart';
import '../util/app_bar.dart';
import '../util/hexagon_button.dart';


class HomePage extends StatefulWidget {

  static const String route = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double buttonRadius = 150;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBarAgeOfGold(),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            print("width: ${constraints.maxWidth}");
            if (constraints.maxWidth < 800) {
              buttonRadius = 100;
            } else {
              buttonRadius = 150;
            }
        if (constraints.maxWidth < 1200) {
          return Stack(
            children: <Widget>[
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 2,
                  yPos: constraints.maxHeight / 2,
                  radius: buttonRadius,
                  buttonFunction: 1
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 4,
                  yPos: constraints.maxHeight / 4,
                  radius: buttonRadius,
                  buttonFunction: 2
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 4,
                  yPos: (constraints.maxHeight / 4) * 3,
                  radius: buttonRadius,
                  buttonFunction: 3
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: (constraints.maxWidth / 4) * 3,
                  yPos: constraints.maxHeight / 4,
                  radius: buttonRadius,
                  buttonFunction: 4
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: (constraints.maxWidth / 4) * 3,
                  yPos: (constraints.maxHeight / 4) * 3,
                  radius: buttonRadius,
                  buttonFunction: 5
              ),
            ],
          );
        } else {
          return Stack(
            children: <Widget>[
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 2,
                  yPos: constraints.maxHeight / 2,
                  radius: buttonRadius,
                  buttonFunction: 1
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 3,
                  yPos: constraints.maxHeight / 4,
                  radius: buttonRadius,
                  buttonFunction: 2
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 3,
                  yPos: (constraints.maxHeight / 4) * 3,
                  radius: buttonRadius,
                  buttonFunction: 3
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: (constraints.maxWidth / 3) * 2,
                  yPos: constraints.maxHeight / 4,
                  radius: buttonRadius,
                  buttonFunction: 4
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: (constraints.maxWidth / 3) * 2,
                  yPos: (constraints.maxHeight / 4) * 3,
                  radius: buttonRadius,
                  buttonFunction: 5
              ),
            ],
          );
        }
          }
      ),
    );
  }
}
