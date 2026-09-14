import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';

@UseCase(
  name: 'Typography Scale',
  type: DsText,
  path: '[Foundations]/Typography',
)
Widget typographyScaleUseCase(BuildContext context) {
  final type = DsTypeScale.standard();

  final variants = <_VariantEntry>[
    _VariantEntry('displayLarge', type.displayLarge, DsText.displayLarge),
    _VariantEntry('displayMedium', type.displayMedium, DsText.displayMedium),
    _VariantEntry('displaySmall', type.displaySmall, DsText.displaySmall),
    _VariantEntry('headlineLarge', type.headlineLarge, DsText.headlineLarge),
    _VariantEntry('headlineMedium', type.headlineMedium, DsText.headlineMedium),
    _VariantEntry('headlineSmall', type.headlineSmall, DsText.headlineSmall),
    _VariantEntry('titleLarge', type.titleLarge, DsText.titleLarge),
    _VariantEntry('titleMedium', type.titleMedium, DsText.titleMedium),
    _VariantEntry('titleSmall', type.titleSmall, DsText.titleSmall),
    _VariantEntry('bodyLarge', type.bodyLarge, DsText.bodyLarge),
    _VariantEntry('bodyMedium', type.bodyMedium, DsText.bodyMedium),
    _VariantEntry('bodySmall', type.bodySmall, DsText.bodySmall),
    _VariantEntry('labelLarge', type.labelLarge, DsText.labelLarge),
    _VariantEntry('labelMedium', type.labelMedium, DsText.labelMedium),
    _VariantEntry('labelSmall', type.labelSmall, DsText.labelSmall),
  ];

  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Typography Scale', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          'All variants rendered with DsText constructors',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 24),
        ...variants.map((entry) => _VariantTile(entry: entry)),
      ],
    ),
  );
}

class _VariantEntry {
  const _VariantEntry(this.name, this.style, this.constructor);

  final String name;
  final TextStyle style;
  final DsText Function(String) constructor;
}

class _VariantTile extends StatelessWidget {
  const _VariantTile({required this.entry});

  final _VariantEntry entry;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  entry.name,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: colors.textSecondary,
                        fontFamily: 'monospace',
                      ),
                ),
              ),
              Expanded(
                flex: 3,
                child: entry.constructor(
                  'The quick brown fox jumps over the lazy dog. 0123456789',
                  color: colors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colors.textTertiary,
                      ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'fontSize: ${entry.style.fontSize?.toStringAsFixed(1)} | '
                  'weight: ${entry.style.fontWeight?.index} | '
                  'height: ${entry.style.height?.toStringAsFixed(2)} | '
                  'letterSpacing: ${entry.style.letterSpacing?.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colors.textTertiary,
                        fontFamily: 'monospace',
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}