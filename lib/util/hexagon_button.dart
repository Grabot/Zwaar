import 'package:flutter/material.dart';
import 'package:zwaar/views/contact.dart';
import 'package:zwaar/views/team.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';

import 'hexagon_painter.dart';

class HexagonButton extends StatefulWidget {

  final double xPos;
  final double yPos;
  final double radius;
  final int buttonFunction;

  const HexagonButton({
    required Key key,
    required this.xPos,
    required this.yPos,
    required this.radius,
    required this.buttonFunction
  }) : super(key: key);

  @override
  _HexagonButtonState createState() => _HexagonButtonState();
}

class _HexagonButtonState extends State<HexagonButton> {

  double radius = 100;

  HexagonPainter? hexagon;

  double containerOffset = 0;

  double paintOffsetX = 0;
  double paintOffsetY = 0;

  bool hoverActive = false;

  @override
  void initState() {
    super.initState();
    radius = widget.radius;

    containerOffset = (radius/4);

    paintOffsetX = radius - (containerOffset/2);
    paintOffsetY = (math.sqrt(3) * radius)/2 - (containerOffset / 2);

    hexagon = HexagonPainter(
        Offset(paintOffsetX, paintOffsetY),
        radius);
  }

  hoverHexagonButton(bool hover) {
    print("hovering hexagon button: $hover");
    hexagon!.changeColour(hover);
    setState(() {
      hoverActive = hover;
    });
  }

  getButtonFunctionality() {
    if (widget.buttonFunction == 1) {
      return teamWidget();
    } else if (widget.buttonFunction == 2) {
      return broCastWidget();
    } else if (widget.buttonFunction == 3) {
      return githubWidget();
    } else if (widget.buttonFunction == 4) {
      return ageOfGoldWidget();
    } else if (widget.buttonFunction == 5) {
      return contactWidget();
    } else {
      return Container();
    }
  }

  pressedHexagonButton() async {
    if (widget.buttonFunction == 1) {
      Navigator.pushNamed(context, Team.route);
    } else if (widget.buttonFunction == 2) {
      const url = 'https://www.brocast.nl';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (widget.buttonFunction == 3) {
      const url = 'https://www.github.com/Grabot';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (widget.buttonFunction == 4) {
      const url = 'https://ageof.gold';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (widget.buttonFunction == 5) {
      Navigator.pushNamed(context, Contact.route);
    } else {
      // should not happen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.yPos-radius,
      left: widget.xPos-radius,
      child: Stack(
        children: [
          hoverActive ? Container(
            height: (math.sqrt(3) * radius) - containerOffset,
            width: (2 * radius) - containerOffset,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffaabbff),
                    blurRadius: 30.0,
                    spreadRadius: 20.0,
                  ),
                ]),
          ) : Container(),
          CustomPaint(
              painter: hexagon!
          ),
          getButtonFunctionality(),
          Container(
            height: (math.sqrt(3) * radius) - containerOffset,
            width: (2 * radius) - containerOffset,
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                pressedHexagonButton();
              },
              onHover: (val) {
                hoverHexagonButton(val);
              },
              hoverColor: Colors.transparent, // We will do our own hover thing
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent
            ),
          ),
        ],
      ),
    );
  }

  TextStyle buttonTextStyle() {
    if (hoverActive) {
      return const TextStyle(color: Color(0xff2d2d2d), fontSize: 30, fontWeight: FontWeight.bold);
    } else {
      return const TextStyle(color: Color(0x8c000000), fontSize: 30, fontWeight: FontWeight.bold);
    }
  }

  Widget teamWidget() {
    return Column(
        children: [
          // The image in the hexagon, leave space at the bottom for text
          const SizedBox(height: 10),
          Container(
            height: (math.sqrt(3) * radius) - containerOffset - 80,
            width: (2 * radius) - containerOffset,
            child: const Image(
              image: AssetImage("assets/images/team.png"),
            ),
          ),
          const SizedBox(height: 20),
          Text(
              style: buttonTextStyle(),
              "The Team"
          )
        ]
    );
  }

  Widget broCastWidget() {
    return Column(
        children: [
          // The image in the hexagon, leave space at the bottom for text
          const SizedBox(height: 10),
          Container(
            height: (math.sqrt(3) * radius) - containerOffset - 50,
            width: (2 * radius) - containerOffset,
            child: const Image(
              image: AssetImage("assets/images/brocast_transparent.png"),
            ),
          ),
          Text(
              style: buttonTextStyle(),
              "Brocast"
          )
        ]
    );
  }

  Widget contactWidget() {
    return Column(
        children: [
          // The image in the hexagon, leave space at the bottom for text
          const SizedBox(height: 30),
          Container(
            height: (math.sqrt(3) * radius) - containerOffset - 100,
            width: (2 * radius) - containerOffset,
            child: const Image(
              image: AssetImage("assets/images/contact.png"),
            ),
          ),
          const SizedBox(height: 20),
          Text(
              style: buttonTextStyle(),
              "Contact"
          )
        ]
    );
  }

  Widget githubWidget() {
    return Column(
        children: [
          // The image in the hexagon, leave space at the bottom for text
          const SizedBox(height: 10),
          Container(
            height: (math.sqrt(3) * radius) - containerOffset - 80,
            width: (2 * radius) - containerOffset,
            child: const Image(
              image: AssetImage("assets/images/github.png"),
            ),
          ),
          const SizedBox(height: 20),
          Text(
              style: buttonTextStyle(),
              "Github"
          )
        ]
    );
  }

  Widget ageOfGoldWidget() {
    return Column(
        children: [
          // The image in the hexagon, leave space at the bottom for text
          const SizedBox(height: 30),
          Container(
            height: (math.sqrt(3) * radius) - containerOffset - 120,
            width: (2 * radius) - containerOffset,
            child: const Image(
              image: AssetImage("assets/images/ageOfGold.png"),
            ),
          ),
          const SizedBox(height: 20),
          Text(
              style: buttonTextStyle(),
              "Age of Gold"
          )
        ]
    );
  }

}
