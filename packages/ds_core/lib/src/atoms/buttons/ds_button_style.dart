part of 'ds_button.dart';

enum DsButtonVariant { primary, secondary, tertiary, destructive }
enum DsButtonSize { small, medium, large }

sealed class DsButtonIcon {
  const DsButtonIcon();
  const factory DsButtonIcon.icon(IconData data) = _DsButtonIconData;
  const factory DsButtonIcon.asset(String path) = _DsButtonIconAsset;
  const factory DsButtonIcon.widget(Widget child) = _DsButtonIconWidget;

  Widget build({Color? color, double? size});
}

final class _DsButtonIconData extends DsButtonIcon {
  const _DsButtonIconData(this.data);
  final IconData data;

  @override
  Widget build({Color? color, double? size}) =>
      Icon(data, color: color, size: size ?? DsSize.size20);
}

final class _DsButtonIconAsset extends DsButtonIcon {
  const _DsButtonIconAsset(this.path);
  final String path;

  @override
  Widget build({Color? color, double? size}) =>
      ImageIcon(AssetImage(path), color: color, size: size ?? DsSize.size20);
}

final class _DsButtonIconWidget extends DsButtonIcon {
  const _DsButtonIconWidget(this.child);
  final Widget child;

  @override
  Widget build({Color? color, double? size}) => child;
}

class _DsButtonStyleResolver {
  static ButtonStyle resolve({
    required DsButtonVariant variant,
    required DsButtonSize size,
    required DsColorScheme colors,
  }) {
    final double height = switch (size) {
      DsButtonSize.small => DsSize.size32,
      DsButtonSize.medium => DsSize.size40,
      DsButtonSize.large => DsSize.size48,
    };

    final EdgeInsetsGeometry padding = switch (size) {
      DsButtonSize.small =>
        EdgeInsets.symmetric(horizontal: DsSpacing.horizontalSpace12),
      DsButtonSize.medium =>
        EdgeInsets.symmetric(horizontal: DsSpacing.horizontalSpace16),
      DsButtonSize.large =>
        EdgeInsets.symmetric(horizontal: DsSpacing.horizontalSpace24),
    };

    final Color foregroundColor;
    final Color backgroundColor;
    final Color disabledForegroundColor;
    final Color disabledBackgroundColor;

    switch (variant) {
      case DsButtonVariant.primary:
        foregroundColor = colors.onPrimary;
        backgroundColor = colors.buttonPrimary;
        disabledForegroundColor = colors.buttonPrimaryTextDisabled;
        disabledBackgroundColor = colors.buttonPrimaryDisabled;
      case DsButtonVariant.secondary:
        foregroundColor = colors.buttonSecondaryText;
        backgroundColor = colors.buttonSecondary;
        disabledForegroundColor = colors.buttonPrimaryTextDisabled;
        disabledBackgroundColor = colors.buttonSecondaryDisabled;
      case DsButtonVariant.tertiary:
        foregroundColor = colors.buttonTertiaryText;
        backgroundColor = Colors.transparent;
        disabledForegroundColor = colors.buttonPrimaryTextDisabled;
        disabledBackgroundColor = Colors.transparent;
      case DsButtonVariant.destructive:
        foregroundColor = colors.buttonDestructiveText;
        backgroundColor = colors.buttonDestructive;
        disabledForegroundColor = colors.buttonDestructiveText;
        disabledBackgroundColor = colors.buttonDestructiveDisabled;
    }

    return ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(height),
      padding: padding,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      shape: RoundedRectangleBorder(borderRadius: DsRadius.circular8),
      elevation: 0,
    );
  }
}
