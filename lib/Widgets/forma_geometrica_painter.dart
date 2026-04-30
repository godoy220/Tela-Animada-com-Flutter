import 'package:flutter/material.dart';

class FormaGeometricaPainter extends CustomPainter {
  final Color corBase;

  FormaGeometricaPainter({required this.corBase});

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = corBase.withValues(alpha: 0.06)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.18),
      150,
      circlePaint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.08, size.height * 0.82),
      190,
      circlePaint,
    );

    final linePaint = Paint()
      ..color = corBase.withValues(alpha: 0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path()
      ..moveTo(0, size.height * 0.42)
      ..quadraticBezierTo(
        size.width / 2,
        size.height * 0.52,
        size.width,
        size.height * 0.34,
      );

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant FormaGeometricaPainter oldDelegate) {
    return oldDelegate.corBase != corBase;
  }
}