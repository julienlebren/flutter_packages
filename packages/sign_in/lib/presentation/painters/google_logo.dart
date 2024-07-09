import 'package:flutter/material.dart';

class GoogleLogoPainter extends CustomPainter {
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
    final length = size.width;
    final verticalOffset = (size.height / 2) - (length / 2);
    final bounds = Offset(0, verticalOffset) & Size.square(length);
    final center = bounds.center;
    final arcThickness = size.width / 4.5;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = arcThickness;

    void drawArc(double startAngle, double sweepAngle, Color color) {
      final finalPaint = paint..color = color;
      canvas.drawArc(bounds, startAngle, sweepAngle, false, finalPaint);
    }

    drawArc(3.5, 1.9, Colors.red);
    drawArc(2.5, 1.0, Colors.amber);
    drawArc(0.9, 1.6, Colors.green.shade600);
    drawArc(-0.18, 1.1, Colors.blue.shade600);

    canvas.drawRect(
      Rect.fromLTRB(
        center.dx,
        center.dy - (arcThickness / 2),
        bounds.centerRight.dx + (arcThickness / 2) - 4,
        bounds.centerRight.dy + (arcThickness / 2),
      ),
      paint
        ..color = Colors.blue.shade600
        ..style = PaintingStyle.fill
        ..strokeWidth = 0,
    );
  }
}
