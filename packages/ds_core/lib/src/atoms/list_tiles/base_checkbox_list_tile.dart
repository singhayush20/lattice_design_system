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
  final DsCheckboxListTileLeading? leading;
  final DsCheckboxListTileTrailing? trailing;
  final bool isEnabled;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;

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

    return CheckboxListTile(
      value: value,
      tristate: tristate,
      onChanged: isEnabled ? onChanged : null,
      title: title != null ? title!.build(context, titleColor) : null,
      subtitle:
          subtitle != null ? subtitle!.build(context, subtitleColor) : null,
      secondary: trailingWidget,
      tileColor: colors.backgroundPrimary,
      contentPadding: EdgeInsets.symmetric(
        horizontal: DsSpacing.horizontalSpace16,
      ),
      controlAffinity: ListTileControlAffinity.trailing,
      dense: variant == DsCheckboxListTileVariant.dense,
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DsRadius.radius4),
      ),
      side: hasError
          ? BorderSide(color: colors.error, width: 2)
          : BorderSide(color: iconColor, width: 2),
    );
  }
}
