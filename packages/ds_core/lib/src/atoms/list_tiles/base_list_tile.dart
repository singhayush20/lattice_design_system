part of 'ds_list_tile.dart';

base class BaseListTile extends StatelessWidget {
  const BaseListTile({
    super.key,
    required this.variant,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.isSelected = false,
    this.isEnabled = true,
  });

  final DsListTileVariant variant;
  final DsListTileTitle? title;
  final DsListTileSubtitle? subtitle;
  final DsListTileLeading? leading;
  final DsListTileTrailing? trailing;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isEnabled;

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

    return ListTile(
      onTap: isEnabled ? onTap : null,
      selected: isSelected,
      selectedTileColor: colors.backgroundSubtle,
      tileColor: colors.backgroundPrimary,
      leading: leadingWidget,
      trailing: variant == DsListTileVariant.navigable
          ? trailingWidget ?? Icon(Icons.chevron_right, color: iconColor)
          : trailingWidget,
      title: title != null ? title!.build(context, titleColor) : null,
      subtitle:
          subtitle != null ? subtitle!.build(context, subtitleColor) : null,
      enabled: isEnabled,
      contentPadding: EdgeInsets.symmetric(
        horizontal: DsSpacing.horizontalSpace16,
      ),
    );
  }
}
