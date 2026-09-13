import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

part 'base_radio_list_tile.dart';
part 'ds_radio_list_tile_style.dart';

final class DsRadioListTile<T> extends BaseRadioListTile<T> {
  const DsRadioListTile({
    super.key,
    required super.value,
    required super.groupValue,
    required super.onChanged,
    super.title,
    super.subtitle,
    super.leading,
    super.trailing,
    super.isEnabled,
  }) : super(variant: DsRadioListTileVariant.defaultVariant);

  const DsRadioListTile.dense({
    super.key,
    required super.value,
    required super.groupValue,
    required super.onChanged,
    super.title,
    super.subtitle,
    super.leading,
    super.trailing,
    super.isEnabled,
  }) : super(variant: DsRadioListTileVariant.dense);
}