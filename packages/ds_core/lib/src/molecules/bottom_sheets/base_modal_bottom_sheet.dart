part of 'ds_modal_bottom_sheet.dart';

base class BaseModalBottomSheet extends StatelessWidget {
  const BaseModalBottomSheet({
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

  final DsBottomSheetTitle title;
  final DsBottomSheetDescription description;
  final DsBottomSheetIcon? primaryIcon;
  final String? primaryButtonText;
  final VoidCallback? onPrimaryButtonPressed;
  final String? secondaryButtonText;
  final VoidCallback? onSecondaryButtonPressed;
  final VoidCallback? onClosePressed;
  final bool isDismissible;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;

    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundSurface,
        borderRadius: BorderRadius.vertical(top: DsRadius.circular16.topLeft),
      ),
      padding: EdgeInsets.fromLTRB(
        DsSpacing.horizontalSpace24,
        DsSpacing.verticalSpace8,
        DsSpacing.horizontalSpace24,
        DsSpacing.verticalSpace24 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isDismissible)
            Center(
              child: Container(
                width: DsSize.size32,
                height: DsSize.size4,
                margin: EdgeInsets.only(bottom: DsSpacing.verticalSpace16),
                decoration: BoxDecoration(
                  color: colors.borderDefaultSecondary,
                  borderRadius: DsRadius.circularFull,
                ),
              ),
            )
          else
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, size: DsSize.iconSize24),
                onPressed: onClosePressed ?? () => Navigator.of(context).pop(),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
          _buildTitle(context),
          SizedBox(height: DsSpacing.verticalSpace8),
          if (primaryIcon != null) ...[
            Center(child: _buildPrimaryIcon(context)),
            SizedBox(height: DsSpacing.verticalSpace24),
          ],
          _buildDescription(context),
          SizedBox(height: DsSpacing.verticalSpace32),
          _buildActions(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) => switch (title) {
    _DsBottomSheetTitleText(:final data) => DsText.titleMedium(data),
    _DsBottomSheetTitleWidget(:final child) => child,
  };

  Widget _buildDescription(BuildContext context) => switch (description) {
    _DsBottomSheetDescriptionText(:final data) => DsText.bodyMedium(data, color: context.dsColors.textSecondary),
    _DsBottomSheetDescriptionWidget(:final child) => child,
  };

  Widget _buildPrimaryIcon(BuildContext context) => switch (primaryIcon!) {
    _DsBottomSheetIconData(:final data) => Icon(data, size: DsSize.iconSize48, color: context.dsColors.primary),
    _DsBottomSheetIconAsset(:final path) => ImageIcon(AssetImage(path), size: DsSize.iconSize48, color: context.dsColors.primary),
  };

  Widget _buildActions(BuildContext context) {
    final hasPrimary = primaryButtonText != null;
    final hasSecondary = secondaryButtonText != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (hasPrimary) DsButton.primary(primaryButtonText!, isFullWidth: true, onTap: onPrimaryButtonPressed),
        if (hasPrimary && hasSecondary) SizedBox(height: DsSpacing.verticalSpace12),
        if (hasSecondary) DsButton.secondary(secondaryButtonText!, isFullWidth: true, onTap: onSecondaryButtonPressed ?? () => Navigator.of(context).pop()),
      ],
    );
  }
}
