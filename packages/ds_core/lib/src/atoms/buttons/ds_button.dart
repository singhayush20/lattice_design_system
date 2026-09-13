import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

part 'base_button.dart';
part 'ds_button_style.dart';

final class DsButton extends BaseButton {
  const DsButton.primary(
    String data, {
    super.key,
    super.onTap,
    super.leading,
    super.size,
    super.isLoading,
    super.isFullWidth,
  }) : super(variant: DsButtonVariant.primary, data: data);

  const DsButton.secondary(
    String data, {
    super.key,
    super.onTap,
    super.leading,
    super.size,
    super.isLoading,
    super.isFullWidth,
  }) : super(variant: DsButtonVariant.secondary, data: data);

  const DsButton.tertiary(
    String data, {
    super.key,
    super.onTap,
    super.leading,
    super.size,
    super.isLoading,
    super.isFullWidth,
  }) : super(variant: DsButtonVariant.tertiary, data: data);

  const DsButton.destructive(
    String data, {
    super.key,
    super.onTap,
    super.leading,
    super.size,
    super.isLoading,
    super.isFullWidth,
  }) : super(variant: DsButtonVariant.destructive, data: data);
}
