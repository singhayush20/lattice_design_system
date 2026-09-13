part of 'ds_divider.dart';

base class BaseDivider extends StatelessWidget {
  const BaseDivider({
    super.key,
    required this.axis,
    required this.strokeStyle,
    required this.weight,
    required this.thickness,
    required this.color,
    required this.indent,
    required this.endIndent,
  });

  final DsDividerAxis axis;
  final DsDividerStrokeStyle strokeStyle;
  final DsDividerWeight weight;
  final double thickness;
  final Color? color;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final effectiveColor =
        color ??
        (weight == DsDividerWeight.defaultWeight
            ? colors.borderDefault
            : colors.borderSubtle);
    final effectiveThickness = thickness;

    switch (axis) {
      case DsDividerAxis.horizontal:
        return SizedBox(
          height: effectiveThickness,
          child: CustomPaint(
            painter: _DividerPainter(
              axis: axis,
              strokeStyle: strokeStyle,
              thickness: effectiveThickness,
              color: effectiveColor,
              indent: indent,
              endIndent: endIndent,
            ),
            size: Size.infinite,
          ),
        );
      case DsDividerAxis.vertical:
        return SizedBox(
          width: effectiveThickness,
          child: CustomPaint(
            painter: _DividerPainter(
              axis: axis,
              strokeStyle: strokeStyle,
              thickness: effectiveThickness,
              color: effectiveColor,
              indent: indent,
              endIndent: endIndent,
            ),
            size: Size.infinite,
          ),
        );
    }
  }
}

class _DividerPainter extends CustomPainter {
  _DividerPainter({
    required this.axis,
    required this.strokeStyle,
    required this.thickness,
    required this.color,
    required this.indent,
    required this.endIndent,
  });

  final DsDividerAxis axis;
  final DsDividerStrokeStyle strokeStyle;
  final double thickness;
  final Color color;
  final double indent;
  final double endIndent;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;

    final double length;
    final Offset start;
    final Offset end;

    if (axis == DsDividerAxis.horizontal) {
      length = size.width - indent - endIndent;
      start = Offset(indent, size.height / 2);
      end = Offset(indent + length, size.height / 2);
    } else {
      length = size.height - indent - endIndent;
      start = Offset(size.width / 2, indent);
      end = Offset(size.width / 2, indent + length);
    }

    switch (strokeStyle) {
      case DsDividerStrokeStyle.solid:
        canvas.drawLine(start, end, paint);
      case DsDividerStrokeStyle.dashed:
        _drawDashedLine(canvas, paint, start, end, length);
      case DsDividerStrokeStyle.dotted:
        _drawDottedLine(canvas, paint, start, end, length);
    }
  }

  void _drawDashedLine(
    Canvas canvas,
    Paint paint,
    Offset start,
    Offset end,
    double length,
  ) {
    const dashLength = 4.0;
    const gapLength = 4.0;
    const patternLength = dashLength + gapLength;

    final int dashCount = (length / patternLength).floor();
    if (dashCount <= 0) return;

    final direction = (end - start) / length;

    for (int i = 0; i < dashCount; i++) {
      final dashStart = start + direction * (i * patternLength);
      final dashEnd = dashStart + direction * dashLength;
      canvas.drawLine(dashStart, dashEnd, paint);
    }

    final remainingLength = length - dashCount * patternLength;
    if (remainingLength > 0) {
      final dashStart = start + direction * (dashCount * patternLength);
      final dashEnd =
          dashStart +
          direction *
              (remainingLength < dashLength ? remainingLength : dashLength);
      canvas.drawLine(dashStart, dashEnd, paint);
    }
  }

  void _drawDottedLine(
    Canvas canvas,
    Paint paint,
    Offset start,
    Offset end,
    double length,
  ) {
    const dotDiameter = 4.0;
    const gapLength = 4.0;
    const patternLength = dotDiameter + gapLength;

    final int dotCount = (length / patternLength).ceil();
    if (dotCount <= 0) return;

    final direction = (end - start) / length;

    for (int i = 0; i < dotCount; i++) {
      final dotCenter =
          start + direction * (i * patternLength + dotDiameter / 2);
      if (dotCenter.dx >= start.dx - 0.5 &&
          dotCenter.dx <= end.dx + 0.5 &&
          dotCenter.dy >= start.dy - 0.5 &&
          dotCenter.dy <= end.dy + 0.5) {
        canvas.drawCircle(dotCenter, thickness / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DividerPainter oldDelegate) {
    return oldDelegate.axis != axis ||
        oldDelegate.strokeStyle != strokeStyle ||
        oldDelegate.thickness != thickness ||
        oldDelegate.color != color ||
        oldDelegate.indent != indent ||
        oldDelegate.endIndent != endIndent;
  }
}
