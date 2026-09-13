part of 'ds_checkbox_list_tile.dart';

base class BaseCheckboxListTile extends StatelessWidget {
  const BaseCheckboxListTile({
    super.key,
    required this.variant,
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.isEnabled = true,
    this.hasError = false,
  });

  final DsCheckboxListTileVariant variant;
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final bool tristate;
  final DsListTileTitle? title;
  final DsListTileSubtitle? subtitle;
  final DsListTileLeading? leading;
  final DsListTileTrailing? trailing;
  final bool isEnabled;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;

    final backgroundColor = hasError
        ? colors.backgroundError
        : colors.backgroundSurface;

    final titleColor = isEnabled
        ? colors.textPrimary
        : colors.textDisabled;

    final subtitleColor = isEnabled
        ? colors.textSecondary
        : colors.textDisabled;

    final iconColor =
        isEnabled ? colors.iconPrimary : colors.iconDisabled;

    final checkboxFillColor = WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.iconDisabled.withAlpha(0x1A);
        }
        if (hasError) {
          return colors.backgroundError;
        }
        return colors.primary;
      },
    );

    final checkColor = isEnabled ? colors.onPrimary : colors.iconDisabled;

    final horizontalPadding = variant == DsCheckboxListTileVariant.dense
        ? DsSpacing.horizontalSpace12
        : DsSpacing.horizontalSpace16;

    final verticalPadding = variant == DsCheckboxListTileVariant.dense
        ? DsSpacing.verticalSpace8
        : DsSpacing.verticalSpace12;

    final checkboxSize = variant == DsCheckboxListTileVariant.dense
        ? DsSize.size20
        : DsSize.size24;

    final minHeight = variant == DsCheckboxListTileVariant.dense
        ? DsSize.size40
        : DsSize.size48;

    return Material(
      color: backgroundColor,
      child: InkWell(
        onTap: isEnabled && onChanged != null
            ? () => onChanged!(tristate && value == null ? true : !(value ?? false))
            : null,
        child: Container(
          constraints: BoxConstraints(minHeight: minHeight),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
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
                  children: [
                    if (title != null)
                      title!.build(context, titleColor),
                    if (subtitle != null) ...[
                      SizedBox(height: DsSpacing.verticalSpace4),
                      subtitle!.build(context, subtitleColor),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[
                SizedBox(width: DsSpacing.horizontalSpace12),
                trailing!.build(color: iconColor),
              ],
              SizedBox(width: DsSpacing.horizontalSpace12),
              SizedBox(
                width: checkboxSize,
                height: checkboxSize,
                child: Checkbox(
                  value: value,
                  tristate: tristate,
                  onChanged: isEnabled ? onChanged : null,
                  fillColor: checkboxFillColor,
                  checkColor: checkColor,
                  side: hasError
                      ? BorderSide(color: colors.error, width: 2)
                      : BorderSide(color: iconColor, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(DsRadius.radius4),
                  ),
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}