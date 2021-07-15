import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedWave extends StatelessWidget {
  final double height;
  final double speed;
  final double offset;
  final Color color;

  const AnimatedWave(
      {required this.height,
      required this.speed,
      this.offset = 0.0,
      this.color = Colors.white,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          height: height,
          width: constraints.biggest.width,
          child: LoopAnimation(
            duration: Duration(milliseconds: (5000 / speed).round()),
            tween: Tween(begin: 0.0, end: 2 * pi),
            builder: (context, widget, value) => CustomPaint(
              foregroundPainter:
                  CurvePainter((value as double) + offset, color),
            ),
          ),
        ),
      );
}

class CurvePainter extends CustomPainter {
  final double value;
  final Color color;

  CurvePainter(this.value, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = color.withAlpha(60);
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
