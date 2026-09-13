import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

part 'base_list_tile.dart';
part 'ds_list_tile_style.dart';

final class DsListTile extends BaseListTile {
  const DsListTile({
    super.key,
    super.title,
    super.subtitle,
    super.leading,
    super.trailing,
    super.onTap,
    super.isSelected,
    super.isEnabled,
  }) : super(variant: DsListTileVariant.defaultVariant);

  const DsListTile.selectable({
    super.key,
    super.title,
    super.subtitle,
    super.leading,
    super.trailing,
    super.onTap,
    super.isSelected = false,
    super.isEnabled,
  }) : super(variant: DsListTileVariant.selectable);

  const DsListTile.navigable({
    super.key,
    super.title,
    super.subtitle,
    super.leading,
    super.trailing,
    super.onTap,
    super.isEnabled,
  }) : super(variant: DsListTileVariant.navigable);
}
