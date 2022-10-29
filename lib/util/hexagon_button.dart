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
  final double maxWidth;
  final double maxHeight;

  const HexagonButton({
    required Key key,
    required this.xPos,
    required this.yPos,
    required this.radius,
    required this.buttonFunction,
    required this.maxWidth,
    required this.maxHeight
  }) : super(key: key);

  @override
  HexagonButtonState createState() => HexagonButtonState();
}

class HexagonButtonState extends State<HexagonButton> {

  double radius = 100;

  HexagonPainter? hexagon;

  double containerOffset = 0;

  double paintOffsetX = 0;
  double paintOffsetY = 0;

  bool hoverActive = false;

  double fontSize = 30;
  @override
  void initState() {
    super.initState();
    radius = widget.radius;

    fontSize = radius / 5;
    containerOffset = (radius/4);

    paintOffsetX = radius - (containerOffset/2);
    paintOffsetY = (math.sqrt(3) * radius)/2 - (containerOffset / 2);

    hexagon = HexagonPainter(
        Offset(paintOffsetX, paintOffsetY),
        radius);
  }

  hoverHexagonButton(bool hover) {
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
    }
    return Container();
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  pressedHexagonButton() async {
    if (widget.buttonFunction == 1) {
      Navigator.pushNamed(context, Team.route);
    } else if (widget.buttonFunction == 2) {
      final Uri url = Uri.parse('https://www.brocast.nl');
      _launchUrl(url);
    } else if (widget.buttonFunction == 3) {
      final Uri url = Uri.parse('https://www.github.com/Grabot');
      _launchUrl(url);
    } else if (widget.buttonFunction == 4) {
      final Uri url = Uri.parse('https://ageof.gold');
      _launchUrl(url);
    } else if (widget.buttonFunction == 5) {
      Navigator.pushNamed(context, Contact.route);
    } else {
      // should not happen
    }
  }

  @override
  Widget build(BuildContext context) {
    print("max height: ${widget.maxHeight}   top: ${widget.yPos-radius}");
    return Positioned(
      top: widget.yPos-radius,
      left: widget.xPos-radius,
      child: Stack(
        children: [
          hoverActive ? Container(
            height: (math.sqrt(3) * radius) - containerOffset,
            width: (2 * radius) - containerOffset,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffaabbff),
                    blurRadius: 30.0,
                    spreadRadius: 20.0,
                  ),
                ]),) : Container(),
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
      return TextStyle(color: const Color(0xff2d2d2d), fontSize: fontSize, fontWeight: FontWeight.bold);
    } else {
      return TextStyle(color: const Color(0x8c000000), fontSize: fontSize, fontWeight: FontWeight.bold);
    }
  }

  Widget teamWidget() {
    double teamOffset = radius/2;
    return Column(
        children: [
          // The image in the hexagon, leave space at the bottom for text
          SizedBox(height: fontSize),
          SizedBox(
            height: (math.sqrt(3) * radius) - containerOffset - teamOffset,
            width: (2 * radius) - containerOffset,
            child: const Image(
              image: AssetImage("assets/images/team.png"),
            ),
          ),
          // const SizedBox(height: 20),
          Text(
              style: buttonTextStyle(),
              "The Team"
          )
        ]
    );
  }

  Widget broCastWidget() {
    double brocastOffset = radius/3;
    return Column(
        children: [
          // The image in the hexagon, leave space at the bottom for text
          SizedBox(height: fontSize/2),
          SizedBox(
            height: (math.sqrt(3) * radius) - containerOffset - brocastOffset,
            width: (2 * radius) - containerOffset,
            child: const Image(
              image: AssetImage("assets/images/brocast_transparent.png"),
            ),
          ),
          Text(
              style: buttonTextStyle(),
              "Brocast"
          ),
        ]
    );
  }

  Widget contactWidget() {
    double contactOffset = radius/2;
    return Column(
        children: [
          // The image in the hexagon, leave space at the bottom for text
          SizedBox(height: fontSize),
          SizedBox(
            height: (math.sqrt(3) * radius) - containerOffset - contactOffset,
            width: (2 * radius) - containerOffset,
            child: const Image(
              image: AssetImage("assets/images/contact.png"),
            ),
          ),
          Text(
              style: buttonTextStyle(),
              "Contact"
          )
        ]
    );
  }

  Widget githubWidget() {
    double githubOffset = radius/2;
    return Column(
        children: [
          // The image in the hexagon, leave space at the bottom for text
          SizedBox(height: fontSize),
          SizedBox(
            height: (math.sqrt(3) * radius) - containerOffset - githubOffset,
            width: (2 * radius) - containerOffset,
            child: const Image(
              image: AssetImage("assets/images/github.png"),
            ),
          ),
          Text(
              style: buttonTextStyle(),
              "Github"
          )
        ]
    );
  }

  Widget ageOfGoldWidget() {
    double ageOfGoldOffset = radius/2;
    return Column(
        children: [
          // The image in the hexagon, leave space at the bottom for text
          SizedBox(height: fontSize),
          SizedBox(
            height: (math.sqrt(3) * radius) - containerOffset - ageOfGoldOffset,
            width: (2 * radius) - containerOffset,
            child: const Image(
              image: AssetImage("assets/images/ageOfGold.png"),
            ),
          ),
          const SizedBox(height: 0),
          Text(
              style: buttonTextStyle(),
              "Age of Gold"
          )
        ]
    );
  }

}
