import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

class DsCircularProgressIndicator extends StatelessWidget {
  const DsCircularProgressIndicator({
    super.key,
    this.color,
    this.strokeWidth = 4.0,
    this.radius = 12.0,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.strokeCap = StrokeCap.round,
    this.semanticsLabel,
    this.semanticsValue,
  });

  final Color? color;
  final double strokeWidth;
  final double radius;
  final double? value;
  final Color? backgroundColor;
  final Animation<Color?>? valueColor;
  final StrokeCap strokeCap;
  final String? semanticsLabel;
  final String? semanticsValue;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final effectiveColor = color ?? colors.loadingIndicatorColorPrimary;
    final effectiveBg = backgroundColor ?? colors.backgroundSubtle;

    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: CircularProgressIndicator(
        value: value,
        strokeWidth: strokeWidth,
        color: effectiveColor,
        backgroundColor: effectiveBg,
        valueColor: valueColor,
        strokeCap: strokeCap,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
      ),
    );
  }
}
