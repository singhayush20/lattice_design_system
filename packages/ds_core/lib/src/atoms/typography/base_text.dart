part of 'ds_text.dart';

base class BaseText extends StatelessWidget {
  const BaseText(
    this._data, {
    super.key,
    required this.variant,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
  });

  final String _data;
  final DsTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    final typeScale = context.dsType;
    final baseStyle = _resolveStyle(typeScale);
    final effectiveStyle = baseStyle.copyWith(color: color);

    return Text(
      _data,
      style: effectiveStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  TextStyle _resolveStyle(DsTypeScale typeScale) => switch (variant) {
        DsTextVariant.displayLarge => typeScale.displayLarge,
        DsTextVariant.displayMedium => typeScale.displayMedium,
        DsTextVariant.displaySmall => typeScale.displaySmall,
        DsTextVariant.headlineLarge => typeScale.headlineLarge,
        DsTextVariant.headlineMedium => typeScale.headlineMedium,
        DsTextVariant.headlineSmall => typeScale.headlineSmall,
        DsTextVariant.titleLarge => typeScale.titleLarge,
        DsTextVariant.titleMedium => typeScale.titleMedium,
        DsTextVariant.titleSmall => typeScale.titleSmall,
        DsTextVariant.bodyLarge => typeScale.bodyLarge,
        DsTextVariant.bodyMedium => typeScale.bodyMedium,
        DsTextVariant.bodySmall => typeScale.bodySmall,
        DsTextVariant.labelLarge => typeScale.labelLarge,
        DsTextVariant.labelMedium => typeScale.labelMedium,
        DsTextVariant.labelSmall => typeScale.labelSmall,
      };
}
