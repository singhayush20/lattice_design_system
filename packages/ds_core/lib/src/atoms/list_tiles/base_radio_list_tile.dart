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
  final DsListTileTitle? title;
  final DsListTileSubtitle? subtitle;
  final DsRadioListTileLeading? leading;
  final DsRadioListTileTrailing? trailing;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final isSelected = value == groupValue;

    final titleColor = isEnabled ? colors.textPrimary : colors.textDisabled;
    final subtitleColor =
        isEnabled ? colors.textSecondary : colors.textDisabled;
    final iconColor = isEnabled ? colors.iconPrimary : colors.iconDisabled;

    Widget? leadingWidget;
    if (leading != null) {
      leadingWidget = leading!.build(color: iconColor);
    }

    Widget? trailingWidget;
    if (trailing != null) {
      trailingWidget = trailing!.build(color: iconColor);
    }

    return RadioListTile<T>(
      value: value,
      groupValue: groupValue,
      onChanged: isEnabled ? onChanged : null,
      title: title != null ? title!.build(context, titleColor) : null,
      subtitle:
          subtitle != null ? subtitle!.build(context, subtitleColor) : null,
      secondary: trailingWidget,
      tileColor: colors.backgroundPrimary,
      selectedTileColor: colors.backgroundSubtle,
      selected: isSelected,
      contentPadding: EdgeInsets.symmetric(
        horizontal: DsSpacing.horizontalSpace16,
      ),
      visualDensity:
          variant == DsRadioListTileVariant.dense ? VisualDensity.compact : null,
      controlAffinity: ListTileControlAffinity.trailing,
      dense: variant == DsRadioListTileVariant.dense,
    );
  }
}
