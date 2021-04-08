import 'package:flutter/material.dart';
import '../helpers/hex_color.dart';

import 'dart:ui' as ui;

class WelcomePainter extends CustomPainter {
  double ratio = 1;

  WelcomePainter(this.ratio);
  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width;
    double y = size.height;

    Path path = new Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(x * 0.4, (y * 0.25) * ratio, x, (y * 0.275) * ratio)
      ..lineTo(x, 0)
      ..lineTo(0, 0)
      ..close();

    // Path path = new Path()
    //   ..moveTo(0, 0)
    //   ..lineTo(0, (0.2 * y) * ratio)
    //   ..quadraticBezierTo(
    //       0.25 * x, (y * 0.35) * ratio, x * 0.5, (y * 0.2) * ratio)
    //   ..quadraticBezierTo(0.75 * x, (y * 0.05) * ratio, x, (y * 0.2) * ratio)
    //   ..lineTo(x, 0)
    //   ..close();

    Path path2 = new Path()
      ..moveTo(0, 0)
      ..moveTo(0, y)
      ..lineTo(x, y)
      ..lineTo(x, y * 0.8)
      ..quadraticBezierTo(x * 0.5, (y * 0.6) / ratio, 0, (y * 0.675) / ratio)
      ..lineTo(0, y)
      ..close();

    Paint paint1 = new Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(0, y * 0.275),
        [
          HexColor("#f05ab2"),
          HexColor("#f7a8bf"),
        ],
      );

    Paint paint2 = new Paint()
      ..shader = ui.Gradient.linear(
        Offset(x, y),
        Offset(0, y * 0.675),
        [
          HexColor("#e832a2"),
          HexColor("#f57acb"),
        ],
      );
    canvas.drawPath(path, paint1);

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
