import 'package:flutter/material.dart';
import 'dart:math' as math;


class HexagonPainter extends CustomPainter {
  static const int sidesOfHexagon = 6;
  final double radius;
  final Offset center;

  Paint normalColour = Paint()..color = const Color(0xff006dff);
  Paint hoverColour = Paint()..color = const Color(0xff8de4ff);
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
    if (hover) {
      currentColour = hoverColour;
    } else {
      currentColour = normalColour;
    }
  }

  Path createHexagonPath() {
    final path = Path();
    var angle = (math.pi * 2) / sidesOfHexagon;
    Offset firstPoint = Offset(radius * math.cos(0.0), radius * math.sin(0.0));
    path.moveTo(firstPoint.dx + center.dx, firstPoint.dy + center.dy);
    for (int i = 1; i <= sidesOfHexagon; i++) {
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
