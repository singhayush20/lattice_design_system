import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';



@UseCase(name: 'Horizontal', type: DsDivider, path: '[Atoms]/Dividers')
Widget horizontalDividerUseCase(BuildContext context) {
  final strokeStyle = context.knobs.object.dropdown<DsDividerStrokeStyle>(
    label: 'Stroke Style',
    options: DsDividerStrokeStyle.values,
    initialOption: DsDividerStrokeStyle.solid,
    labelBuilder: (v) => v.name,
  );
  final weight = context.knobs.object.dropdown<DsDividerWeight>(
    label: 'Weight',
    options: DsDividerWeight.values,
    initialOption: DsDividerWeight.defaultWeight,
    labelBuilder: (v) => v.name,
  );
  final thickness = context.knobs.double.slider(
    label: 'Thickness',
    initialValue: 1.0,
    min: 0.5,
    max: 4.0,
    divisions: 7,
  );
  final indent = context.knobs.double.slider(
    label: 'Indent',
    initialValue: 0,
    min: 0,
    max: 48,
    divisions: 12,
  );
  final endIndent = context.knobs.double.slider(
    label: 'End Indent',
    initialValue: 0,
    min: 0,
    max: 48,
    divisions: 12,
  );
  final color = context.knobs.color(
    label: 'Custom Color',
    initialValue: Colors.transparent,
  );

  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Horizontal Divider',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          DsDivider(
            axis: DsDividerAxis.horizontal,
            strokeStyle: strokeStyle,
            weight: weight,
            thickness: thickness,
            indent: indent,
            endIndent: endIndent,
            color: color == Colors.transparent ? null : color,
          ),
          const SizedBox(height: 16),
          const Text('With content above and below'),
          const SizedBox(height: 16),
          DsDivider(
            axis: DsDividerAxis.horizontal,
            strokeStyle: strokeStyle,
            weight: weight,
            thickness: thickness,
            indent: indent,
            endIndent: endIndent,
            color: color == Colors.transparent ? null : color,
          ),
        ],
      ),
    ),
  );
}

@UseCase(name: 'Vertical', type: DsDivider, path: '[Atoms]/Dividers')
Widget verticalDividerUseCase(BuildContext context) {
  final strokeStyle = context.knobs.object.dropdown<DsDividerStrokeStyle>(
    label: 'Stroke Style',
    options: DsDividerStrokeStyle.values,
    initialOption: DsDividerStrokeStyle.solid,
    labelBuilder: (v) => v.name,
  );
  final weight = context.knobs.object.dropdown<DsDividerWeight>(
    label: 'Weight',
    options: DsDividerWeight.values,
    initialOption: DsDividerWeight.defaultWeight,
    labelBuilder: (v) => v.name,
  );
  final thickness = context.knobs.double.slider(
    label: 'Thickness',
    initialValue: 1.0,
    min: 0.5,
    max: 4.0,
    divisions: 7,
  );
  final indent = context.knobs.double.slider(
    label: 'Indent',
    initialValue: 0,
    min: 0,
    max: 48,
    divisions: 12,
  );
  final endIndent = context.knobs.double.slider(
    label: 'End Indent',
    initialValue: 0,
    min: 0,
    max: 48,
    divisions: 12,
  );
  final color = context.knobs.color(
    label: 'Custom Color',
    initialValue: Colors.transparent,
  );

  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Vertical Divider',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Before'),
              const SizedBox(width: 16),
              SizedBox(
                height: 80,
                child: DsDivider(
                  axis: DsDividerAxis.vertical,
                  strokeStyle: strokeStyle,
                  weight: weight,
                  thickness: thickness,
                  indent: indent,
                  endIndent: endIndent,
                  color: color == Colors.transparent ? null : color,
                ),
              ),
              const SizedBox(width: 16),
              const Text('After'),
            ],
          ),
        ],
      ),
    ),
  );
}

@UseCase(name: 'Presets', type: DsDivider, path: '[Atoms]/Dividers')
Widget dividerPresetsUseCase(BuildContext context) {
  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Divider Presets',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          _PresetTile(label: 'Solid (default)', child: const DsDivider()),
          const SizedBox(height: 8),
          _PresetTile(label: 'Dashed', child: const DsDivider.dashed()),
          const SizedBox(height: 8),
          _PresetTile(label: 'Dotted', child: const DsDivider.dotted()),
          const SizedBox(height: 8),
          _PresetTile(label: 'Subtle', child: const DsDivider.subtle()),
          const SizedBox(height: 8),
          _PresetTile(
            label: 'Vertical',
            child: SizedBox(height: 60, child: const DsDivider.vertical()),
          ),
        ],
      ),
    ),
  );
}

class _PresetTile extends StatelessWidget {
  const _PresetTile({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: colors.textSecondary),
          ),
        ),
        Expanded(flex: 3, child: child),
      ],
    );
  }
}
