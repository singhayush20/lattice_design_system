import 'package:flutter/material.dart';
import 'package:ds_core/src/foundations/colors/ds_color_scheme.dart';

/// Extension on [BuildContext] to easily access the color scheme.
extension DsColorsX on BuildContext {
  DsColorScheme get dsColors =>
      Theme.of(this).extension<DsColorScheme>() ?? DsColorScheme.light();
}
