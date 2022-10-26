import 'package:flutter/material.dart';
import 'dart:math' as math;

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

  HexagonPainter? test;

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

    test = HexagonPainter(
        Offset(paintOffsetX, paintOffsetY),
        radius);
  }

  hoverHexagonButton(bool hover) {
    print("hovering hexagon button: $hover");
    test!.changeColour(hover);
    setState(() {
      hoverActive = hover;
    });
  }

  getButtonFunctionality() {
    if (widget.buttonFunction == 1) {
      return githubWidget();
    } else {
      return Container();
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
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffaabbff),
                    blurRadius: 30.0,
                    spreadRadius: 20.0,
                  ),
                ]),
          ) : Container(),
          CustomPaint(
              painter: test!
          ),
          getButtonFunctionality(),
          Container(
            height: (math.sqrt(3) * radius) - containerOffset,
            width: (2 * radius) - containerOffset,
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                print("tapped");
              },
              onHover: (val) {
                hoverHexagonButton(val);
              },
              hoverColor: Colors.transparent, // We will do our own hover thing
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

  Widget githubWidget() {
    return Column(
        children: [
          // The image in the hexagon, leave space at the bottom for text
          Container(
            height: (math.sqrt(3) * radius) - containerOffset - 30,
            width: (2 * radius) - containerOffset,
            child: Image(
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

}

class HexagonPainter extends CustomPainter {
  static const int SIDES_OF_HEXAGON = 6;
  final double radius;
  final Offset center;

  Paint normalColour = Paint()..color = Color(0xff006dff);
  Paint hoverColour = Paint()..color = Color(0xff8de4ff);
  Paint currentColour = Paint()..color = Colors.blue;

  HexagonPainter(this.center, this.radius) {
    currentColour = normalColour;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = createHexagonPath();
    canvas.drawPath(path, currentColour);
  }

  changeColour(bool hover) {
    print("change colour?");
    if (hover) {
      currentColour = hoverColour;
    } else {
      currentColour = normalColour;
    }
  }

  Path createHexagonPath() {
    final path = Path();
    var angle = (math.pi * 2) / SIDES_OF_HEXAGON;
    Offset firstPoint = Offset(radius * math.cos(0.0), radius * math.sin(0.0));
    path.moveTo(firstPoint.dx + center.dx, firstPoint.dy + center.dy);
    for (int i = 1; i <= SIDES_OF_HEXAGON; i++) {
      double x = radius * math.cos(angle * i) + center.dx;
      double y = radius * math.sin(angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
