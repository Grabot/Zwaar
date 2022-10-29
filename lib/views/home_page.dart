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
    bool showLogo = true;
    return Scaffold(
      appBar: appBarAgeOfGold(context, true),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            print("height: ${constraints.maxHeight}   ${constraints.minHeight}");
            if (constraints.maxHeight < 300) {
              showLogo = false;
            } else {
              showLogo = true;
            }
            if (constraints.maxWidth < constraints.maxHeight) {
              buttonRadius = constraints.maxWidth / 8;
            } else {
              buttonRadius = constraints.maxHeight / 8;
            }
        if (constraints.maxWidth < 1200) {
          return Stack(
            children: <Widget>[
              showLogo ? logo(constraints.maxWidth) : Container(),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 2,
                  yPos: (constraints.maxHeight / 8) * 5,
                  radius: buttonRadius,
                  buttonFunction: 1,
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 4,
                  yPos: (constraints.maxHeight / 8) * 3,
                  radius: buttonRadius,
                  buttonFunction: 2,
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 4,
                  yPos: (constraints.maxHeight / 8) * 7,
                  radius: buttonRadius,
                  buttonFunction: 3,
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: (constraints.maxWidth / 4) * 3,
                  yPos: (constraints.maxHeight / 8) * 3,
                  radius: buttonRadius,
                  buttonFunction: 4,
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: (constraints.maxWidth / 4) * 3,
                  yPos: (constraints.maxHeight / 8) * 7,
                  radius: buttonRadius,
                  buttonFunction: 5,
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight
              ),
            ],
          );
        } else {
          return Stack(
            children: <Widget>[
              showLogo ? logo(constraints.maxWidth) : Container(),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 2,
                  yPos: (constraints.maxHeight / 8) * 5,
                  radius: buttonRadius,
                  buttonFunction: 1,
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 3,
                  yPos: (constraints.maxHeight / 8) * 3,
                  radius: buttonRadius,
                  buttonFunction: 2,
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: constraints.maxWidth / 3,
                  yPos: (constraints.maxHeight / 8) * 7,
                  radius: buttonRadius,
                  buttonFunction: 3,
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: (constraints.maxWidth / 3) * 2,
                  yPos: (constraints.maxHeight / 8) * 3,
                  radius: buttonRadius,
                  buttonFunction: 4,
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight
              ),
              HexagonButton(
                  key: UniqueKey(),
                  xPos: (constraints.maxWidth / 3) * 2,
                  yPos: (constraints.maxHeight / 8) * 7,
                  radius: buttonRadius,
                  buttonFunction: 5,
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight
              ),
            ],
          );
        }
          }
      ),
    );
  }

  Widget logo(double maxWidth) {
    double logoWidth = 600;
    double logoHeight = 150;
    double sizeOfFont = 30;
    if (maxWidth < 800) {
      logoWidth = (maxWidth/5)*4;
      logoHeight = maxWidth/6;
      sizeOfFont = 10;
    }
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: logoHeight,
            width: logoWidth-50,
            child: const Image(
              image: AssetImage("assets/images/Zwaar.png"),
              fit: BoxFit.fill,
            ),
          ),
          Text(
            "       Developers",
            style: TextStyle(color: const Color(0xff949494), fontSize: sizeOfFont, fontWeight: FontWeight.bold)
          )
        ]
      ),
    );
  }
}
