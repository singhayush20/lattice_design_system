import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';

@UseCase(
  name: 'Color Palette',
  type: DsColorScheme,
  path: '[Foundations]/Colors',
)
Widget colorPaletteUseCase(BuildContext context) {
  final scheme = DsColorScheme.light();
  final darkScheme = DsColorScheme.dark();

  final colorMap = <String, Color>{
    'primary': scheme.primary,
    'primaryLight': scheme.primaryLight,
    'primaryDark': scheme.primaryDark,
    'secondary': scheme.secondary,
    'secondaryLight': scheme.secondaryLight,
    'secondaryDark': scheme.secondaryDark,
    'onPrimary': scheme.onPrimary,
    'onSecondary': scheme.onSecondary,
    'backgroundPrimary': scheme.backgroundPrimary,
    'backgroundSurface': scheme.backgroundSurface,
    'backgroundSubtle': scheme.backgroundSubtle,
    'backgroundSuccess': scheme.backgroundSuccess,
    'backgroundEnabled': scheme.backgroundEnabled,
    'backgroundWarning': scheme.backgroundWarning,
    'backgroundError': scheme.backgroundError,
    'backgroundInfo': scheme.backgroundInfo,
    'backgroundDisabled': scheme.backgroundDisabled,
    'textPrimary': scheme.textPrimary,
    'textSecondary': scheme.textSecondary,
    'textTertiary': scheme.textTertiary,
    'textDisabled': scheme.textDisabled,
    'textOnDark': scheme.textOnDark,
    'textLink': scheme.textLink,
    'textSuccess': scheme.textSuccess,
    'textWarning': scheme.textWarning,
    'textError': scheme.textError,
    'textAccent': scheme.textAccent,
    'borderDefault': scheme.borderDefault,
    'borderDefaultSecondary': scheme.borderDefaultSecondary,
    'borderSubtle': scheme.borderSubtle,
    'borderDisabled': scheme.borderDisabled,
    'borderPrimary': scheme.borderPrimary,
    'borderSuccess': scheme.borderSuccess,
    'borderWarning': scheme.borderWarning,
    'borderError': scheme.borderError,
    'borderInfo': scheme.borderInfo,
    'buttonPrimary': scheme.buttonPrimary,
    'buttonPrimaryHover': scheme.buttonPrimaryHover,
    'buttonPrimaryDisabled': scheme.buttonPrimaryDisabled,
    'buttonPrimaryText': scheme.buttonPrimaryText,
    'buttonPrimaryTextDisabled': scheme.buttonPrimaryTextDisabled,
    'buttonPrimaryPressed': scheme.buttonPrimaryPressed,
    'buttonSecondary': scheme.buttonSecondary,
    'buttonSecondaryBorder': scheme.buttonSecondaryBorder,
    'buttonSecondaryText': scheme.buttonSecondaryText,
    'buttonSecondaryHover': scheme.buttonSecondaryHover,
    'buttonSecondaryDisabled': scheme.buttonSecondaryDisabled,
    'buttonSecondaryPressed': scheme.buttonSecondaryPressed,
    'buttonSecondaryBorderDisabled': scheme.buttonSecondaryBorderDisabled,
    'buttonTertiaryText': scheme.buttonTertiaryText,
    'buttonTertiaryHover': scheme.buttonTertiaryHover,
    'buttonDestructive': scheme.buttonDestructive,
    'buttonDestructiveHover': scheme.buttonDestructiveHover,
    'buttonDestructiveDisabled': scheme.buttonDestructiveDisabled,
    'buttonDestructiveText': scheme.buttonDestructiveText,
    'textFieldBackground': scheme.textFieldBackground,
    'textFieldText': scheme.textFieldText,
    'textFieldBorder': scheme.textFieldBorder,
    'textFieldBorderFocused': scheme.textFieldBorderFocused,
    'textFieldBorderHover': scheme.textFieldBorderHover,
    'textFieldBorderDisabled': scheme.textFieldBorderDisabled,
    'textFieldBorderError': scheme.textFieldBorderError,
    'textFieldBorderSuccess': scheme.textFieldBorderSuccess,
    'textFieldBackgroundDisabled': scheme.textFieldBackgroundDisabled,
    'textFieldTextDisabled': scheme.textFieldTextDisabled,
    'textFieldHint': scheme.textFieldHint,
    'textFieldCursor': scheme.textFieldCursor,
    'textFieldCursorError': scheme.textFieldCursorError,
    'textFieldLabel': scheme.textFieldLabel,
    'textFieldLabelFocused': scheme.textFieldLabelFocused,
    'textFieldHelper': scheme.textFieldHelper,
    'textFieldErrorText': scheme.textFieldErrorText,
    'textFieldSuccessText': scheme.textFieldSuccessText,
    'iconPrimary': scheme.iconPrimary,
    'iconSecondary': scheme.iconSecondary,
    'iconDisabled': scheme.iconDisabled,
    'iconOnPrimary': scheme.iconOnPrimary,
    'iconSuccess': scheme.iconSuccess,
    'iconWarning': scheme.iconWarning,
    'iconError': scheme.iconError,
    'iconInfo': scheme.iconInfo,
    'success': scheme.success,
    'warning': scheme.warning,
    'error': scheme.error,
    'info': scheme.info,
    'navigationBarShadow': scheme.navigationBarShadow,
    'overlayColor': scheme.overlayColor,
    'dividerColor': scheme.dividerColor,
    'dividerColorSecondary': scheme.dividerColorSecondary,
    'transparent': scheme.transparent,
    'white': scheme.white,
    'black': scheme.black,
    'gradientStart': scheme.gradientStart,
    'gradientEnd': scheme.gradientEnd,
    'loadingIndicatorColorPrimary': scheme.loadingIndicatorColorPrimary,
  };

  final darkColorMap = <String, Color>{
    'primary': darkScheme.primary,
    'primaryLight': darkScheme.primaryLight,
    'primaryDark': darkScheme.primaryDark,
    'secondary': darkScheme.secondary,
    'secondaryLight': darkScheme.secondaryLight,
    'secondaryDark': darkScheme.secondaryDark,
    'onPrimary': darkScheme.onPrimary,
    'onSecondary': darkScheme.onSecondary,
    'backgroundPrimary': darkScheme.backgroundPrimary,
    'backgroundSurface': darkScheme.backgroundSurface,
    'backgroundSubtle': darkScheme.backgroundSubtle,
    'backgroundSuccess': darkScheme.backgroundSuccess,
    'backgroundEnabled': darkScheme.backgroundEnabled,
    'backgroundWarning': darkScheme.backgroundWarning,
    'backgroundError': darkScheme.backgroundError,
    'backgroundInfo': darkScheme.backgroundInfo,
    'backgroundDisabled': darkScheme.backgroundDisabled,
    'textPrimary': darkScheme.textPrimary,
    'textSecondary': darkScheme.textSecondary,
    'textTertiary': darkScheme.textTertiary,
    'textDisabled': darkScheme.textDisabled,
    'textOnDark': darkScheme.textOnDark,
    'textLink': darkScheme.textLink,
    'textSuccess': darkScheme.textSuccess,
    'textWarning': darkScheme.textWarning,
    'textError': darkScheme.textError,
    'textAccent': darkScheme.textAccent,
    'borderDefault': darkScheme.borderDefault,
    'borderDefaultSecondary': darkScheme.borderDefaultSecondary,
    'borderSubtle': darkScheme.borderSubtle,
    'borderDisabled': darkScheme.borderDisabled,
    'borderPrimary': darkScheme.borderPrimary,
    'borderSuccess': darkScheme.borderSuccess,
    'borderWarning': darkScheme.borderWarning,
    'borderError': darkScheme.borderError,
    'borderInfo': darkScheme.borderInfo,
    'buttonPrimary': darkScheme.buttonPrimary,
    'buttonPrimaryHover': darkScheme.buttonPrimaryHover,
    'buttonPrimaryDisabled': darkScheme.buttonPrimaryDisabled,
    'buttonPrimaryText': darkScheme.buttonPrimaryText,
    'buttonPrimaryTextDisabled': darkScheme.buttonPrimaryTextDisabled,
    'buttonPrimaryPressed': darkScheme.buttonPrimaryPressed,
    'buttonSecondary': darkScheme.buttonSecondary,
    'buttonSecondaryBorder': darkScheme.buttonSecondaryBorder,
    'buttonSecondaryText': darkScheme.buttonSecondaryText,
    'buttonSecondaryHover': darkScheme.buttonSecondaryHover,
    'buttonSecondaryDisabled': darkScheme.buttonSecondaryDisabled,
    'buttonSecondaryPressed': darkScheme.buttonSecondaryPressed,
    'buttonSecondaryBorderDisabled': darkScheme.buttonSecondaryBorderDisabled,
    'buttonTertiaryText': darkScheme.buttonTertiaryText,
    'buttonTertiaryHover': darkScheme.buttonTertiaryHover,
    'buttonDestructive': darkScheme.buttonDestructive,
    'buttonDestructiveHover': darkScheme.buttonDestructiveHover,
    'buttonDestructiveDisabled': darkScheme.buttonDestructiveDisabled,
    'buttonDestructiveText': darkScheme.buttonDestructiveText,
    'textFieldBackground': darkScheme.textFieldBackground,
    'textFieldText': darkScheme.textFieldText,
    'textFieldBorder': darkScheme.textFieldBorder,
    'textFieldBorderFocused': darkScheme.textFieldBorderFocused,
    'textFieldBorderHover': darkScheme.textFieldBorderHover,
    'textFieldBorderDisabled': darkScheme.textFieldBorderDisabled,
    'textFieldBorderError': darkScheme.textFieldBorderError,
    'textFieldBorderSuccess': darkScheme.textFieldBorderSuccess,
    'textFieldBackgroundDisabled': darkScheme.textFieldBackgroundDisabled,
    'textFieldTextDisabled': darkScheme.textFieldTextDisabled,
    'textFieldHint': darkScheme.textFieldHint,
    'textFieldCursor': darkScheme.textFieldCursor,
    'textFieldCursorError': darkScheme.textFieldCursorError,
    'textFieldLabel': darkScheme.textFieldLabel,
    'textFieldLabelFocused': darkScheme.textFieldLabelFocused,
    'textFieldHelper': darkScheme.textFieldHelper,
    'textFieldErrorText': darkScheme.textFieldErrorText,
    'textFieldSuccessText': darkScheme.textFieldSuccessText,
    'iconPrimary': darkScheme.iconPrimary,
    'iconSecondary': darkScheme.iconSecondary,
    'iconDisabled': darkScheme.iconDisabled,
    'iconOnPrimary': darkScheme.iconOnPrimary,
    'iconSuccess': darkScheme.iconSuccess,
    'iconWarning': darkScheme.iconWarning,
    'iconError': darkScheme.iconError,
    'iconInfo': darkScheme.iconInfo,
    'success': darkScheme.success,
    'warning': darkScheme.warning,
    'error': darkScheme.error,
    'info': darkScheme.info,
    'navigationBarShadow': darkScheme.navigationBarShadow,
    'overlayColor': darkScheme.overlayColor,
    'dividerColor': darkScheme.dividerColor,
    'dividerColorSecondary': darkScheme.dividerColorSecondary,
    'transparent': darkScheme.transparent,
    'white': darkScheme.white,
    'black': darkScheme.black,
    'gradientStart': darkScheme.gradientStart,
    'gradientEnd': darkScheme.gradientEnd,
    'loadingIndicatorColorPrimary': darkScheme.loadingIndicatorColorPrimary,
  };

  return _ColorSwatchGrid(
    lightColors: colorMap,
    darkColors: darkColorMap,
  );
}

class _ColorSwatchGrid extends StatelessWidget {
  const _ColorSwatchGrid({
    required this.lightColors,
    required this.darkColors,
  });

  final Map<String, Color> lightColors;
  final Map<String, Color> darkColors;

  @override
  Widget build(BuildContext context) {
    final keys = lightColors.keys.toList()..sort();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = isDark ? darkColors : lightColors;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isDark ? 'Dark Mode Colors' : 'Light Mode Colors',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: keys.map((key) {
              final color = colors[key]!;
              final luminance = color.computeLuminance();
              final textColor = luminance > 0.5 ? Colors.black : Colors.white;

              return Tooltip(
                message: '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}',
                child: SizedBox(
                  width: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                            width: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        key,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(fontSize: 10),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}