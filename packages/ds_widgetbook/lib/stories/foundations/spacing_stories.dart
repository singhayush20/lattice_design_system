import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';

@UseCase(
  name: 'Spacing Tokens',
  type: DsSpacing,
  path: '[Foundations]/Spacing',
)
Widget spacingTokensUseCase(BuildContext context) {
  final horizontalSpacings = <String, double>{
    'horizontalSpace2': DsSpacing.horizontalSpace2,
    'horizontalSpace4': DsSpacing.horizontalSpace4,
    'horizontalSpace6': DsSpacing.horizontalSpace6,
    'horizontalSpace8': DsSpacing.horizontalSpace8,
    'horizontalSpace10': DsSpacing.horizontalSpace10,
    'horizontalSpace12': DsSpacing.horizontalSpace12,
    'horizontalSpace14': DsSpacing.horizontalSpace14,
    'horizontalSpace16': DsSpacing.horizontalSpace16,
    'horizontalSpace20': DsSpacing.horizontalSpace20,
    'horizontalSpace24': DsSpacing.horizontalSpace24,
    'horizontalSpace28': DsSpacing.horizontalSpace28,
    'horizontalSpace32': DsSpacing.horizontalSpace32,
    'horizontalSpace36': DsSpacing.horizontalSpace36,
    'horizontalSpace40': DsSpacing.horizontalSpace40,
    'horizontalSpace44': DsSpacing.horizontalSpace44,
    'horizontalSpace48': DsSpacing.horizontalSpace48,
    'horizontalSpace52': DsSpacing.horizontalSpace52,
    'horizontalSpace56': DsSpacing.horizontalSpace56,
    'horizontalSpace60': DsSpacing.horizontalSpace60,
    'horizontalSpace64': DsSpacing.horizontalSpace64,
  };

  final verticalSpacings = <String, double>{
    'verticalSpace2': DsSpacing.verticalSpace2,
    'verticalSpace4': DsSpacing.verticalSpace4,
    'verticalSpace6': DsSpacing.verticalSpace6,
    'verticalSpace8': DsSpacing.verticalSpace8,
    'verticalSpace10': DsSpacing.verticalSpace10,
    'verticalSpace12': DsSpacing.verticalSpace12,
    'verticalSpace14': DsSpacing.verticalSpace14,
    'verticalSpace16': DsSpacing.verticalSpace16,
    'verticalSpace20': DsSpacing.verticalSpace20,
    'verticalSpace24': DsSpacing.verticalSpace24,
    'verticalSpace28': DsSpacing.verticalSpace28,
    'verticalSpace32': DsSpacing.verticalSpace32,
    'verticalSpace36': DsSpacing.verticalSpace36,
    'verticalSpace40': DsSpacing.verticalSpace40,
    'verticalSpace44': DsSpacing.verticalSpace44,
    'verticalSpace48': DsSpacing.verticalSpace48,
    'verticalSpace52': DsSpacing.verticalSpace52,
    'verticalSpace56': DsSpacing.verticalSpace56,
    'verticalSpace60': DsSpacing.verticalSpace60,
    'verticalSpace64': DsSpacing.verticalSpace64,
  };

  final radialSpacings = <String, double>{
    'radialSpace2': DsSpacing.radialSpace2,
    'radialSpace4': DsSpacing.radialSpace4,
    'radialSpace6': DsSpacing.radialSpace6,
    'radialSpace8': DsSpacing.radialSpace8,
    'radialSpace10': DsSpacing.radialSpace10,
    'radialSpace12': DsSpacing.radialSpace12,
    'radialSpace14': DsSpacing.radialSpace14,
    'radialSpace16': DsSpacing.radialSpace16,
    'radialSpace20': DsSpacing.radialSpace20,
    'radialSpace24': DsSpacing.radialSpace24,
    'radialSpace28': DsSpacing.radialSpace28,
    'radialSpace32': DsSpacing.radialSpace32,
    'radialSpace36': DsSpacing.radialSpace36,
    'radialSpace40': DsSpacing.radialSpace40,
    'radialSpace44': DsSpacing.radialSpace44,
    'radialSpace48': DsSpacing.radialSpace48,
    'radialSpace52': DsSpacing.radialSpace52,
    'radialSpace56': DsSpacing.radialSpace56,
    'radialSpace60': DsSpacing.radialSpace60,
    'radialSpace64': DsSpacing.radialSpace64,
  };

  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Spacing Tokens', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          'All spacing values in logical pixels (dp) - responsive via flutter_screenutil',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 24),
        _SpacingSection(
          title: 'Horizontal Spacing',
          tokens: horizontalSpacings,
          isHorizontal: true,
        ),
        const SizedBox(height: 32),
        _SpacingSection(
          title: 'Vertical Spacing',
          tokens: verticalSpacings,
          isHorizontal: false,
        ),
        const SizedBox(height: 32),
        _SpacingSection(
          title: 'Radial Spacing (border radius)',
          tokens: radialSpacings,
          isHorizontal: false,
        ),
      ],
    ),
  );
}

@UseCase(
  name: 'Size Tokens',
  type: DsSize,
  path: '[Foundations]/Spacing',
)
Widget sizeTokensUseCase(BuildContext context) {
  final sizes = <String, double>{
    'size1': DsSize.size1,
    'size2': DsSize.size2,
    'size4': DsSize.size4,
    'size6': DsSize.size6,
    'size8': DsSize.size8,
    'size10': DsSize.size10,
    'size12': DsSize.size12,
    'size14': DsSize.size14,
    'size16': DsSize.size16,
    'size18': DsSize.size18,
    'size20': DsSize.size20,
    'size24': DsSize.size24,
    'size28': DsSize.size28,
    'size32': DsSize.size32,
    'size36': DsSize.size36,
    'size40': DsSize.size40,
    'size44': DsSize.size44,
    'size48': DsSize.size48,
    'size52': DsSize.size52,
    'size56': DsSize.size56,
    'size60': DsSize.size60,
    'size64': DsSize.size64,
    'size72': DsSize.size72,
    'size80': DsSize.size80,
    'size96': DsSize.size96,
    'size112': DsSize.size112,
    'size128': DsSize.size128,
    'size144': DsSize.size144,
    'size160': DsSize.size160,
  };

  final iconSizes = <String, double>{
    'iconSize14': DsSize.iconSize14,
    'iconSize16': DsSize.iconSize16,
    'iconSize18': DsSize.iconSize18,
    'iconSize20': DsSize.iconSize20,
    'iconSize24': DsSize.iconSize24,
    'iconSize32': DsSize.iconSize32,
    'iconSize48': DsSize.iconSize48,
  };

  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size Tokens', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          'All size values in logical pixels (dp) - responsive via flutter_screenutil',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 24),
        _SizeSection(title: 'General Sizes', tokens: sizes),
        const SizedBox(height: 32),
        _SizeSection(title: 'Icon Sizes', tokens: iconSizes),
      ],
    ),
  );
}

class _SpacingSection extends StatelessWidget {
  const _SpacingSection({
    required this.title,
    required this.tokens,
    required this.isHorizontal,
  });

  final String title;
  final Map<String, double> tokens;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final keys = tokens.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: keys.map((key) {
            final value = tokens[key]!;
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colors.backgroundSurface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colors.borderDefault),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isHorizontal)
                    Container(
                      width: value.clamp(16, 200).toDouble(),
                      height: 4,
                      color: colors.primary,
                    )
                  else
                    Container(
                      width: 60,
                      height: value.clamp(4, 64).toDouble(),
                      color: colors.primary,
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
                    '${value.toStringAsFixed(1)}dp',
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

class _SizeSection extends StatelessWidget {
  const _SizeSection({
    required this.title,
    required this.tokens,
  });

  final String title;
  final Map<String, double> tokens;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final keys = tokens.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: keys.map((key) {
            final value = tokens[key]!;
            return Container(
              width: value.clamp(32, 160).toDouble(),
              height: value.clamp(32, 160).toDouble(),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colors.backgroundSurface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colors.borderDefault),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: value,
                    height: value,
                    color: colors.primary.withValues(alpha: 0.2),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    key,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colors.textSecondary,
                          fontFamily: 'monospace',
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${value.toStringAsFixed(1)}dp',
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