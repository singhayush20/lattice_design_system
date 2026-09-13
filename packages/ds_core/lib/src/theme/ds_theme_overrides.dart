import 'package:flutter/material.dart';
import '../foundations/colors/ds_color_scheme.dart';
import '../foundations/colors/ds_colors_x.dart';
import '../foundations/typography/ds_type_scale.dart';
import '../foundations/typography/ds_text_style_x.dart';

class DsThemeOverride extends StatelessWidget {
  const DsThemeOverride({
    super.key,
    required this.child,
    this.colorScheme,
    this.typeScale,
  });

  final Widget child;
  final DsColorScheme? colorScheme;
  final DsTypeScale? typeScale;

  @override
  Widget build(BuildContext context) {
    final currentColors = context.dsColors;
    final currentType = context.dsType;

    final newColors = colorScheme ?? currentColors;
    final newType = typeScale ?? currentType;

    return Theme(
      data: Theme.of(context).copyWith(extensions: [newColors, newType]),
      child: child,
    );
  }
}
