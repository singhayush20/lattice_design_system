part of 'ds_button.dart';

base class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.data,
    required this.variant,
    this.size = DsButtonSize.medium,
    this.onTap,
    this.leading,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  final String data;
  final VoidCallback? onTap;
  final DsButtonIcon? leading;
  final DsButtonVariant variant;
  final DsButtonSize size;
  final bool isLoading;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final style = _DsButtonStyleResolver.resolve(
      variant: variant,
      size: size,
      colors: colors,
    );

    final iconColor = style.foregroundColor?.resolve({}) ?? colors.onPrimary;

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        style: style,
        onPressed: isLoading ? null : onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              leading!.build(color: iconColor),
              SizedBox(width: DsSpacing.horizontalSpace8),
            ],
            DsText.labelLarge(data),
          ],
        ),
      ),
    );
  }
}
