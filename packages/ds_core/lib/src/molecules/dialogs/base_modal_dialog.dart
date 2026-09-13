part of 'ds_modal_dialog.dart';

base class BaseModalDialog extends StatelessWidget {
  const BaseModalDialog({
    super.key,
    required this.title,
    required this.description,
    this.primaryIcon,
    this.primaryButtonText,
    this.onPrimaryButtonPressed,
    this.secondaryButtonText,
    this.onSecondaryButtonPressed,
    this.onClosePressed,
    this.isDismissible = true,
  });

  final DsDialogTitle title;
  final DsDialogDescription description;
  final DsDialogIcon? primaryIcon;
  final String? primaryButtonText;
  final VoidCallback? onPrimaryButtonPressed;
  final String? secondaryButtonText;
  final VoidCallback? onSecondaryButtonPressed;
  final VoidCallback? onClosePressed;
  final bool isDismissible;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;

    return Dialog(
      backgroundColor: colors.backgroundSurface,
      shape: RoundedRectangleBorder(borderRadius: DsRadius.circular16),
      insetPadding: EdgeInsets.symmetric(horizontal: DsSpacing.horizontalSpace24),
      child: Padding(
        padding: EdgeInsets.all(DsSpacing.radialSpace24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildTitle(context)),
                if (!isDismissible)
                  IconButton(
                    icon: Icon(Icons.close, size: DsSize.iconSize24),
                    onPressed: onClosePressed ?? () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
              ],
            ),
            SizedBox(height: DsSpacing.verticalSpace16),
            if (primaryIcon != null) ...[
              Center(child: _buildPrimaryIcon(context)),
              SizedBox(height: DsSpacing.verticalSpace24),
            ],
            _buildDescription(context),
            SizedBox(height: DsSpacing.verticalSpace32),
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return switch (title) {
      _DsDialogTitleText(:final data) => DsText.titleMedium(data),
      _DsDialogTitleWidget(:final child) => child,
    };
  }

  Widget _buildDescription(BuildContext context) {
    return switch (description) {
      _DsDialogDescriptionText(:final data) => DsText.bodyMedium(data, color: context.dsColors.textSecondary),
      _DsDialogDescriptionWidget(:final child) => child,
    };
  }

  Widget _buildPrimaryIcon(BuildContext context) {
    final color = context.dsColors.primary;
    return switch (primaryIcon!) {
      _DsDialogIconData(:final data) => Icon(data, size: DsSize.iconSize48, color: color),
      _DsDialogIconAsset(:final path) => ImageIcon(AssetImage(path), size: DsSize.iconSize48, color: color),
    };
  }

  Widget _buildActions(BuildContext context) {
    final hasPrimary = primaryButtonText != null;
    final hasSecondary = secondaryButtonText != null;

    return Row(
      mainAxisAlignment: hasSecondary ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
      children: [
        if (hasSecondary)
          DsButton.secondary(
            secondaryButtonText!,
            onTap: onSecondaryButtonPressed ?? () => Navigator.of(context).pop(),
          ),
        if (hasPrimary)
          DsButton.primary(
            primaryButtonText!,
            onTap: onPrimaryButtonPressed,
          ),
      ],
    );
  }
}
