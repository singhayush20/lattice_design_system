import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';



@UseCase(
  name: 'Circular Progress',
  type: DsCircularProgressIndicator,
  path: '[Atoms]/Progress Indicators',
)
Widget circularProgressUseCase(BuildContext context) {
  final color = context.knobs.object.dropdown<_ProgressColor>(
    label: 'Color',
    options: _ProgressColor.values,
    initialOption: _ProgressColor.primary,
    labelBuilder: (v) => v.label,
  );
  final strokeWidth = context.knobs.double.slider(
    label: 'Stroke Width',
    initialValue: 4.0,
    min: 1.0,
    max: 8.0,
    divisions: 7,
  );
  final radius = context.knobs.double.slider(
    label: 'Radius',
    initialValue: 12.0,
    min: 8.0,
    max: 48.0,
    divisions: 20,
  );
  final isIndeterminate = context.knobs.boolean(
    label: 'Indeterminate',
    initialValue: true,
  );
  final value = isIndeterminate
      ? null
      : context.knobs.double.slider(
          label: 'Progress',
          initialValue: 0.5,
          min: 0.0,
          max: 1.0,
          divisions: 20,
        );
  final backgroundColor = context.knobs.color(
    label: 'Background Color',
    initialValue: Colors.transparent,
  );
  final strokeCap = context.knobs.object.dropdown<StrokeCap>(
    label: 'Stroke Cap',
    options: StrokeCap.values,
    initialOption: StrokeCap.round,
    labelBuilder: (v) => v.name,
  );

  final resolvedColor = _resolveColor(context, color);
  final resolvedBgColor = backgroundColor == Colors.transparent
      ? null
      : backgroundColor;

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isIndeterminate
              ? 'Indeterminate'
              : 'Determinate (${(value * 100).round()}%)',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 24),
        DsCircularProgressIndicator(
          color: resolvedColor,
          strokeWidth: strokeWidth,
          radius: radius,
          value: value,
          backgroundColor: resolvedBgColor,
          strokeCap: strokeCap,
        ),
      ],
    ),
  );
}

enum _ProgressColor {
  primary('Primary'),
  error('Error'),
  success('Success'),
  warning('Warning'),
  info('Info');

  const _ProgressColor(this.label);
  final String label;
}

Color? _resolveColor(BuildContext context, _ProgressColor color) {
  final colors = context.dsColors;
  switch (color) {
    case _ProgressColor.primary:
      return colors.loadingIndicatorColorPrimary;
    case _ProgressColor.error:
      return colors.error;
    case _ProgressColor.success:
      return colors.success;
    case _ProgressColor.warning:
      return colors.warning;
    case _ProgressColor.info:
      return colors.info;
  }
}
