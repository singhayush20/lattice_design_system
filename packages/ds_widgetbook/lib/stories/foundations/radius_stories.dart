import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';

@UseCase(
  name: 'Border Radius',
  type: DsRadius,
  path: '[Foundations]/Radius',
)
Widget radiusTokensUseCase(BuildContext context) {
  final radii = <String, double>{
    'radius2': DsRadius.radius2,
    'radius4': DsRadius.radius4,
    'radius6': DsRadius.radius6,
    'radius8': DsRadius.radius8,
    'radius10': DsRadius.radius10,
    'radius12': DsRadius.radius12,
    'radius16': DsRadius.radius16,
    'radius20': DsRadius.radius20,
    'radius24': DsRadius.radius24,
    'radius28': DsRadius.radius28,
    'radius32': DsRadius.radius32,
    'radiusFull': DsRadius.radiusFull,
  };

  final circularRadii = <String, BorderRadius>{
    'circular2': DsRadius.circular2,
    'circular4': DsRadius.circular4,
    'circular6': DsRadius.circular6,
    'circular8': DsRadius.circular8,
    'circular10': DsRadius.circular10,
    'circular12': DsRadius.circular12,
    'circular16': DsRadius.circular16,
    'circular20': DsRadius.circular20,
    'circular24': DsRadius.circular24,
    'circular28': DsRadius.circular28,
    'circular32': DsRadius.circular32,
    'circularFull': DsRadius.circularFull,
  };

  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Border Radius Tokens', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          'All radius values in logical pixels (dp) - responsive via flutter_screenutil',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 24),
        _RadiusSection(title: 'Radius Values (double)', radii: radii),
        const SizedBox(height: 32),
        _RadiusSection(title: 'Circular BorderRadius', radii: circularRadii),
      ],
    ),
  );
}

class _RadiusSection extends StatelessWidget {
  const _RadiusSection({
    required this.title,
    required this.radii,
  });

  final String title;
  final Map<String, dynamic> radii;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final keys = radii.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: keys.map((key) {
            final radius = radii[key]!;
            final radiusValue = radius is double ? radius : radius.topLeft.x;

            return Container(
              width: 100,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colors.backgroundSurface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colors.borderDefault),
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: colors.primary.withValues(alpha: 0.15),
                      borderRadius: radius is BorderRadius ? radius : BorderRadius.circular(radiusValue),
                      border: Border.all(color: colors.primary, width: 2),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    key,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colors.textSecondary,
                          fontFamily: 'monospace',
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${radiusValue.toStringAsFixed(1)}dp',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colors.textTertiary,
                          fontFamily: 'monospace',
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}