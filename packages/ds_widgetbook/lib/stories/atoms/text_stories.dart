import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';

@UseCase(
  name: 'All Variants',
  type: DsText,
  path: '[Atoms]/Typography',
)
Widget textVariantsUseCase(BuildContext context) {
  final variant = context.knobs.object.dropdown<DsTextVariant>(
    label: 'Variant',
    options: DsTextVariant.values,
    initialOption: DsTextVariant.bodyLarge,
    labelBuilder: (v) => v.name,
  );
  final data = context.knobs.string(
    label: 'Text',
    initialValue: 'The quick brown fox jumps over the lazy dog.',
  );
  final useSemanticColor = context.knobs.boolean(
    label: 'Use Semantic Color',
    initialValue: false,
  );
  final semanticColor = useSemanticColor
      ? context.knobs.object.dropdown<_SemanticColor>(
          label: 'Color',
          options: _SemanticColor.values,
          initialOption: _SemanticColor.primary,
          labelBuilder: (v) => v.label,
        )
      : null;

  final color = useSemanticColor && semanticColor != null
      ? _resolveSemanticColor(context, semanticColor)
      : null;

  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Text Variant: ${variant.name}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: _buildText(variant, data, color),
        ),
        const SizedBox(height: 16),
        Text(
          'All Variants Preview',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ...DsTextVariant.values.map((v) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildText(v, '$data (${v.name})', color),
            )),
      ],
    ),
  );
}

Widget _buildText(DsTextVariant variant, String data, Color? color) {
  return switch (variant) {
    DsTextVariant.displayLarge => DsText.displayLarge(data, color: color),
    DsTextVariant.displayMedium => DsText.displayMedium(data, color: color),
    DsTextVariant.displaySmall => DsText.displaySmall(data, color: color),
    DsTextVariant.headlineLarge => DsText.headlineLarge(data, color: color),
    DsTextVariant.headlineMedium => DsText.headlineMedium(data, color: color),
    DsTextVariant.headlineSmall => DsText.headlineSmall(data, color: color),
    DsTextVariant.titleLarge => DsText.titleLarge(data, color: color),
    DsTextVariant.titleMedium => DsText.titleMedium(data, color: color),
    DsTextVariant.titleSmall => DsText.titleSmall(data, color: color),
    DsTextVariant.bodyLarge => DsText.bodyLarge(data, color: color),
    DsTextVariant.bodyMedium => DsText.bodyMedium(data, color: color),
    DsTextVariant.bodySmall => DsText.bodySmall(data, color: color),
    DsTextVariant.labelLarge => DsText.labelLarge(data, color: color),
    DsTextVariant.labelMedium => DsText.labelMedium(data, color: color),
    DsTextVariant.labelSmall => DsText.labelSmall(data, color: color),
  };
}

enum _SemanticColor {
  primary('Primary'),
  secondary('Secondary'),
  error('Error'),
  success('Success'),
  warning('Warning'),
  info('Info'),
  link('Link'),
  onSurface('On Surface');

  const _SemanticColor(this.label);
  final String label;
}

Color? _resolveSemanticColor(BuildContext context, _SemanticColor color) {
  final colors = context.dsColors;
  switch (color) {
    case _SemanticColor.primary:
      return colors.textLink;
    case _SemanticColor.secondary:
      return colors.textSecondary;
    case _SemanticColor.error:
      return colors.textError;
    case _SemanticColor.success:
      return colors.textSuccess;
    case _SemanticColor.warning:
      return colors.textWarning;
    case _SemanticColor.info:
      return colors.textInfo;
    case _SemanticColor.link:
      return colors.textLink;
    case _SemanticColor.onSurface:
      return colors.textPrimary;
  }
}