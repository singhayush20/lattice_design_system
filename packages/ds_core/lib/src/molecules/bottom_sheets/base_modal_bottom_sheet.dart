part of 'ds_modal_bottom_sheet.dart';

base class BaseModalBottomSheet extends StatelessWidget {
  const BaseModalBottomSheet({
    super.key,
    required this.title,
    required this.description,
    this.primaryIcon,
    this.iconPrimaryColor,
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
  final Color? iconPrimaryColor;
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
          _BottomSheetTitle(title: title),
          SizedBox(height: DsSpacing.verticalSpace8),
          if (primaryIcon != null) ...[
            Center(
              child: _BottomSheetPrimaryIcon(
                icon: primaryIcon!,
                color: iconPrimaryColor ?? colors.iconPrimary,
              ),
            ),
            SizedBox(height: DsSpacing.verticalSpace24),
          ],
          _BottomSheetDescription(description: description),
          SizedBox(height: DsSpacing.verticalSpace32),
          _BottomSheetActions(
            primaryButtonText: primaryButtonText,
            onPrimaryButtonPressed: onPrimaryButtonPressed,
            secondaryButtonText: secondaryButtonText,
            onSecondaryButtonPressed: onSecondaryButtonPressed,
          ),
        ],
      ),
    );
  }

}

class _BottomSheetTitle extends StatelessWidget {
  const _BottomSheetTitle({required this.title});
  final DsBottomSheetTitle title;

  @override
  Widget build(BuildContext context) => switch (title) {
        _DsBottomSheetTitleText(:final data) => DsText.titleMedium(data),
        _DsBottomSheetTitleWidget(:final child) => child,
      };
}

class _BottomSheetDescription extends StatelessWidget {
  const _BottomSheetDescription({required this.description});
  final DsBottomSheetDescription description;

  @override
  Widget build(BuildContext context) => switch (description) {
        _DsBottomSheetDescriptionText(:final data) => DsText.bodyMedium(
              data,
              color: context.dsColors.textSecondary,
            ),
        _DsBottomSheetDescriptionWidget(:final child) => child,
      };
}

class _BottomSheetPrimaryIcon extends StatelessWidget {
  const _BottomSheetPrimaryIcon({required this.icon, required this.color});
  final DsBottomSheetIcon icon;
  final Color color;

  @override
  Widget build(BuildContext context) => switch (icon) {
        _DsBottomSheetIconData(:final data) => Icon(
              data,
              size: DsSize.iconSize48,
              color: color,
            ),
        _DsBottomSheetIconAsset(:final path) => ImageIcon(
              AssetImage(path),
              size: DsSize.iconSize48,
              color: color,
            ),
      };
}

class _BottomSheetActions extends StatelessWidget {
  const _BottomSheetActions({
    this.primaryButtonText,
    this.onPrimaryButtonPressed,
    this.secondaryButtonText,
    this.onSecondaryButtonPressed,
  });

  final String? primaryButtonText;
  final VoidCallback? onPrimaryButtonPressed;
  final String? secondaryButtonText;
  final VoidCallback? onSecondaryButtonPressed;

  @override
  Widget build(BuildContext context) {
    final hasPrimary = primaryButtonText != null;
    final hasSecondary = secondaryButtonText != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (hasPrimary)
          DsButton.primary(
            primaryButtonText!,
            isFullWidth: true,
            onTap: onPrimaryButtonPressed,
          ),
        if (hasPrimary && hasSecondary)
          SizedBox(height: DsSpacing.verticalSpace12),
        if (hasSecondary)
          DsButton.secondary(
            secondaryButtonText!,
            isFullWidth: true,
            onTap: onSecondaryButtonPressed ?? () => Navigator.of(context).pop(),
          ),
      ],
    );
  }
}
