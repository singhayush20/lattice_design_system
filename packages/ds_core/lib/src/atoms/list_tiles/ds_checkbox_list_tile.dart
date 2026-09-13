import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

part 'base_checkbox_list_tile.dart';
part 'ds_checkbox_list_tile_style.dart';

final class DsCheckboxListTile extends BaseCheckboxListTile {
  const DsCheckboxListTile({
    super.key,
    required super.value,
    required super.onChanged,
    super.tristate = false,
    super.title,
    super.subtitle,
    super.leading,
    super.trailing,
    super.isEnabled = true,
    super.hasError = false,
  }) : super(variant: DsCheckboxListTileVariant.defaultVariant);

  const DsCheckboxListTile.dense({
    super.key,
    required super.value,
    required super.onChanged,
    super.tristate = false,
    super.title,
    super.subtitle,
    super.leading,
    super.trailing,
    super.isEnabled = true,
    super.hasError = false,
  }) : super(variant: DsCheckboxListTileVariant.dense);
}
