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

    final backgroundColor = isSelected
        ? colors.backgroundSubtle
        : colors.backgroundSurface;

    final titleColor = isEnabled
        ? colors.textPrimary
        : colors.textDisabled;

    final subtitleColor = isEnabled
        ? colors.textSecondary
        : colors.textDisabled;

    final iconColor =
        isEnabled ? colors.iconPrimary : colors.iconDisabled;

    return Material(
      color: backgroundColor,
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DsSpacing.horizontalSpace16,
            vertical: DsSpacing.verticalSpace12,
          ),
          child: Row(
            children: [
              if (leading != null) ...[
                leading!.build(color: iconColor),
                const SizedBox(width: DsSpacing.horizontalSpace12),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      _buildTitle(context, titleColor),
                    if (subtitle != null) ...[
                      const SizedBox(height: DsSpacing.verticalSpace4),
                      _buildSubtitle(context, subtitleColor),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: DsSpacing.horizontalSpace12),
                trailing!.build(color: iconColor),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, Color color) {
    return switch (title!) {
      _DsListTileTitleText(:final data) =>
        DsText.bodyLarge(data, color: color),
      _DsListTileTitleWidget(:final child) => DefaultTextStyle(
          style: context.dsType.bodyLarge.copyWith(color: color),
          child: child,
        ),
    };
  }

  Widget _buildSubtitle(BuildContext context, Color color) {
    return switch (subtitle!) {
      _DsListTileSubtitleText(:final data) =>
        DsText.bodyMedium(data, color: color),
      _DsListTileSubtitleWidget(:final child) => DefaultTextStyle(
          style: context.dsType.bodyMedium.copyWith(color: color),
          child: child,
        ),
    };
  }
}
