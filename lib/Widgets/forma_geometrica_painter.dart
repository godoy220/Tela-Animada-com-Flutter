import 'package:flutter/material.dart';

// Requisito BÔNUS: CustomPainter desenhando formas geométricas
class FormaGeometricaPainter extends CustomPainter {
  final Color corBase;

  FormaGeometricaPainter({required this.corBase});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = corBase.withValues(alpha: 0.05)
      ..style = PaintingStyle.fill;

    // Desenhando círculos decorativos no fundo da tela
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.15), 150, paint);
    canvas.drawCircle(Offset(size.width * 0.1, size.height * 0.85), 200, paint);
    
    final pathPaint = Paint()
      ..color = corBase.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
      
    final path = Path()
      ..moveTo(0, size.height * 0.4)
      ..quadraticBezierTo(size.width / 2, size.height * 0.5, size.width, size.height * 0.3);
      
    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}