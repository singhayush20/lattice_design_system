import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

part 'base_divider.dart';
part 'ds_divider_style.dart';

final class DsDivider extends BaseDivider {
  const DsDivider({
    super.key,
    super.axis = DsDividerAxis.horizontal,
    super.strokeStyle = DsDividerStrokeStyle.solid,
    super.weight = DsDividerWeight.defaultWeight,
    super.thickness = 1.0,
    super.color,
    super.indent = 0,
    super.endIndent = 0,
  });

  const DsDivider.vertical({
    super.key,
    super.strokeStyle = DsDividerStrokeStyle.solid,
    super.weight = DsDividerWeight.defaultWeight,
    super.thickness = 1.0,
    super.color,
    super.indent = 0,
    super.endIndent = 0,
  }) : super(axis: DsDividerAxis.vertical);

  const DsDivider.dashed({
    super.key,
    super.axis = DsDividerAxis.horizontal,
    super.weight = DsDividerWeight.defaultWeight,
    super.thickness = 1.0,
    super.color,
    super.indent = 0,
    super.endIndent = 0,
  }) : super(strokeStyle: DsDividerStrokeStyle.dashed);

  const DsDivider.dotted({
    super.key,
    super.axis = DsDividerAxis.horizontal,
    super.weight = DsDividerWeight.defaultWeight,
    super.thickness = 1.0,
    super.color,
    super.indent = 0,
    super.endIndent = 0,
  }) : super(strokeStyle: DsDividerStrokeStyle.dotted);

  const DsDivider.subtle({
    super.key,
    super.axis = DsDividerAxis.horizontal,
    super.strokeStyle = DsDividerStrokeStyle.solid,
    super.thickness = 1.0,
    super.color,
    super.indent = 0,
    super.endIndent = 0,
  }) : super(weight: DsDividerWeight.subtle);
}
