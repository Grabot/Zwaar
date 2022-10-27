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
      appBar: appBarAgeOfGold(context, true),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        print("height: ${constraints.maxHeight}  width: ${constraints.maxWidth}");
        if (constraints.maxWidth < 800 || constraints.maxHeight < 800) {
          buttonRadius = 100;
        } else if (constraints.maxHeight < 1400 || constraints.maxWidth < 2200) {
          buttonRadius = 150;
        } else if (constraints.maxHeight < 1800 || constraints.maxWidth < 3500) {
          buttonRadius = 220;
        } else {
          buttonRadius = 300;
        }
        if (constraints.maxWidth < 1200) {
          return Stack(
            children: <Widget>[
              logo(constraints.maxWidth / 2, 0),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 2,
                  yPos: (constraints.maxHeight / 8) * 5,
                  radius: buttonRadius,
                  buttonFunction: 1
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 4,
                  yPos: (constraints.maxHeight / 8) * 3,
                  radius: buttonRadius,
                  buttonFunction: 2
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 4,
                  yPos: (constraints.maxHeight / 8) * 7,
                  radius: buttonRadius,
                  buttonFunction: 3
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: (constraints.maxWidth / 4) * 3,
                  yPos: (constraints.maxHeight / 8) * 3,
                  radius: buttonRadius,
                  buttonFunction: 4
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: (constraints.maxWidth / 4) * 3,
                  yPos: (constraints.maxHeight / 8) * 7,
                  radius: buttonRadius,
                  buttonFunction: 5
              ),
            ],
          );
        } else {
          return Stack(
            children: <Widget>[
              logo(constraints.maxWidth / 2, 0),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 2,
                  yPos: (constraints.maxHeight / 8) * 5,
                  radius: buttonRadius,
                  buttonFunction: 1
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 3,
                  yPos: (constraints.maxHeight / 8) * 3,
                  radius: buttonRadius,
                  buttonFunction: 2
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 3,
                  yPos: (constraints.maxHeight / 8) * 7,
                  radius: buttonRadius,
                  buttonFunction: 3
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: (constraints.maxWidth / 3) * 2,
                  yPos: (constraints.maxHeight / 8) * 3,
                  radius: buttonRadius,
                  buttonFunction: 4
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: (constraints.maxWidth / 3) * 2,
                  yPos: (constraints.maxHeight / 8) * 7,
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

  Widget logo(double xPos, double yPos) {
    double logoWidth = 600;
    return Positioned(
      top: yPos,
      left: xPos - (logoWidth / 2),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: logoWidth-50,
            child: const Image(
              image: AssetImage("assets/images/Zwaar.png"),
            ),
          ),
          const Text(
            "       Developers",
            style: TextStyle(color: Color(0xff949494), fontSize: 30, fontWeight: FontWeight.bold)
          )
        ]
      ),
    );
  }
}
