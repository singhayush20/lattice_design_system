part of 'ds_radio_list_tile.dart';

base class BaseRadioListTile<T> extends StatelessWidget {
  const BaseRadioListTile({
    super.key,
    required this.variant,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.isEnabled = true,
  });

  final DsRadioListTileVariant variant;
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final DsRadioListTileTitle? title;
  final DsRadioListTileSubtitle? subtitle;
  final DsRadioListTileLeading? leading;
  final DsRadioListTileTrailing? trailing;
  final bool isEnabled;

  bool get _isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;

    final backgroundColor = _isSelected
        ? colors.backgroundSubtle
        : colors.backgroundSurface;

    final titleColor = isEnabled
        ? colors.textPrimary
        : colors.textDisabled;

    final subtitleColor = isEnabled
        ? colors.textSecondary
        : colors.textDisabled;

    final iconColor = isEnabled ? colors.iconPrimary : colors.iconDisabled;

    final fillColor = WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) {
        return colors.iconDisabled.withValues(alpha: 0.12);
      }
      return colors.primary.withValues(alpha: 0.12);
    });

    return RadioGroup<T>(
      groupValue: groupValue,
      onChanged: onChanged ?? (_) {},
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: isEnabled && onChanged != null
              ? () => onChanged!.call(value)
              : null,
          child: SizedBox(
            height: DsSize.size48,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DsSpacing.horizontalSpace16,
                vertical: variant == DsRadioListTileVariant.dense
                    ? DsSpacing.verticalSpace8
                    : DsSpacing.verticalSpace12,
              ),
              child: Row(
                children: [
                  if (leading != null) ...[
                    leading!.build(color: iconColor),
                    SizedBox(width: DsSpacing.horizontalSpace12),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (title != null)
                          _buildTitle(context, titleColor),
                        if (subtitle != null) ...[
                          SizedBox(height: DsSpacing.verticalSpace4),
                          _buildSubtitle(context, subtitleColor),
                        ],
                      ],
                    ),
                  ),
                  Radio<T>(
                    value: value,
                    fillColor: fillColor,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    enabled: isEnabled,
                  ),
                  if (trailing != null) ...[
                    SizedBox(width: DsSpacing.horizontalSpace12),
                    trailing!.build(color: iconColor),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, Color color) {
    return switch (title!) {
      _DsRadioListTileTitleText(:final data) =>
        DsText.bodyLarge(data, color: color),
      _DsRadioListTileTitleWidget(:final child) => DefaultTextStyle(
          style: context.dsType.bodyLarge.copyWith(color: color),
          child: child,
        ),
    };
  }

  Widget _buildSubtitle(BuildContext context, Color color) {
    return switch (subtitle!) {
      _DsRadioListTileSubtitleText(:final data) =>
        DsText.bodyMedium(data, color: color),
      _DsRadioListTileSubtitleWidget(:final child) => DefaultTextStyle(
          style: context.dsType.bodyMedium.copyWith(color: color),
          child: child,
        ),
    };
  }
}