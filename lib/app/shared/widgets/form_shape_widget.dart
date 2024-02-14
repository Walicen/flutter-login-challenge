import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class FormShapeWidget extends StatelessWidget {
  const FormShapeWidget({super.key, required this.colors, required this.width});

  final List<Color> colors;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, (width * 1.5384615384615385).toDouble()),
      painter: CustomFormPainter(
        colors: colors,
      ),
    );
  }
}

class CustomFormPainter extends CustomPainter {
  final List<Color> colors;

  CustomFormPainter({super.repaint, required this.colors});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(200, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    paint.shader = ui.Gradient.linear(
      Offset(size.width * 0.50, size.height * 0.04),
      Offset(size.width * 0.99, size.height * 0.95),
      colors,
      [0.00, 1.00],
    );

    Path path = Path();
    path.moveTo(
      size.width * 0.3872308,
      size.height * 0.0447000,
    );
    path.cubicTo(
      size.width * 0.5410769,
      size.height * 0.0447000,
      size.width * 0.9873077,
      size.height * 0.2111500,
      size.width * 0.9873077,
      size.height * 0.3911500,
    );
    path.cubicTo(
      size.width * 0.9873077,
      size.height * 0.4911500,
      size.width * 0.8380000,
      size.height * 0.9537500,
      size.width * 0.5687692,
      size.height * 0.9537500,
    );
    path.cubicTo(
      size.width * 0.4149231,
      size.height * 0.9537500,
      size.width * 0.0094615,
      size.height * 0.5170000,
      size.width * 0.0094615,
      size.height * 0.3420000,
    );
    path.cubicTo(
      size.width * 0.0094615,
      size.height * 0.2420000,
      size.width * 0.1180000,
      size.height * 0.0447000,
      size.width * 0.3872308,
      size.height * 0.0447000,
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
