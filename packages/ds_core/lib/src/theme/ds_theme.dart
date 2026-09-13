import 'package:flutter/material.dart';
import '../foundations/colors/ds_color_scheme.dart';
import '../foundations/typography/ds_type_scale.dart';

class DsTheme {
  DsTheme._();

  static ThemeData light() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        extensions: [
          DsColorScheme.light(),
          DsTypeScale.standard(),
        ],
      );

  static ThemeData dark() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        extensions: [
          DsColorScheme.dark(),
          DsTypeScale.standard(),
        ],
      );
}
