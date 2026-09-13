import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

part 'base_text.dart';
part 'ds_text_style.dart';

final class DsText extends BaseText {
  const DsText.displayLarge(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.displayLarge);

  const DsText.displayMedium(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.displayMedium);

  const DsText.displaySmall(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.displaySmall);

  const DsText.headlineLarge(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.headlineLarge);

  const DsText.headlineMedium(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.headlineMedium);

  const DsText.headlineSmall(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.headlineSmall);

  const DsText.titleLarge(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.titleLarge);

  const DsText.titleMedium(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.titleMedium);

  const DsText.titleSmall(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.titleSmall);

  const DsText.bodyLarge(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.bodyLarge);

  const DsText.bodyMedium(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.bodyMedium);

  const DsText.bodySmall(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.bodySmall);

  const DsText.labelLarge(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.labelLarge);

  const DsText.labelMedium(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.labelMedium);

  const DsText.labelSmall(
    super._data, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
  }) : super(variant: DsTextVariant.labelSmall);
}
