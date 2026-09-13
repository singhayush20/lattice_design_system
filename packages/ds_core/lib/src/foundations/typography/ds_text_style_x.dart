import 'package:flutter/material.dart';
import 'ds_type_scale.dart';

extension DsTypeScaleX on BuildContext {
  DsTypeScale get dsType => Theme.of(this).extension<DsTypeScale>() ?? DsTypeScale.standard();
}
