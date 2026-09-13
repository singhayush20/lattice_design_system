import 'package:flutter/material.dart';
import 'base_colors.dart';

/// Semantic color scheme derived from base palette for light and dark modes.
class DsColorScheme extends ThemeExtension<DsColorScheme> {
  const DsColorScheme({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.outline,
    required this.outlineVariant,
    required this.surfaceContainer,
    required this.surfaceContainerHighest,
    required this.surfaceContainerLow,
    required this.surfaceContainerLowest,
    required this.surface,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.scrim,
    this.surfaceTint,
    this.shadow,
  }) : super();

  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color outline;
  final Color? outlineVariant;
  final Color surfaceContainer;
  final Color surfaceContainerHighest;
  final Color surfaceContainerLow;
  final Color surfaceContainerLowest;
  final Color surface;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color scrim;
  final Color? surfaceTint;
  final Color? shadow;

  static const _base = baseColors;

  static DsColorScheme light() => DsColorScheme(
    primary: _base.blue500,
    onPrimary: _base.neutral50,
    primaryContainer: _base.blue100,
    onPrimaryContainer: _base.blue900,
    secondary: _base.neutral600,
    onSecondary: _base.neutral50,
    secondaryContainer: _base.neutral100,
    onSecondaryContainer: _base.neutral800,
    tertiary: _base.teal500,
    onTertiary: _base.neutral50,
    tertiaryContainer: _base.teal100,
    onTertiaryContainer: _base.teal900,
    error: _base.red500,
    onError: _base.neutral50,
    errorContainer: _base.red100,
    onErrorContainer: _base.red900,
    outline: _base.neutral300,
    outlineVariant: _base.neutral200,
    surfaceContainer: _base.neutral100,
    surfaceContainerHighest: _base.neutral200,
    surfaceContainerLow: _base.neutral50,
    surfaceContainerLowest: _base.white,
    surface: _base.neutral50,
    inverseSurface: _base.neutral900,
    inverseOnSurface: _base.neutral50,
    inversePrimary: _base.blue400,
    scrim: _base.neutral900.withAlpha(0x80),
    surfaceTint: null,
    shadow: null,
  );

  static DsColorScheme dark() => DsColorScheme(
    primary: _base.blue400,
    onPrimary: _base.blue900,
    primaryContainer: _base.blue900,
    onPrimaryContainer: _base.blue100,
    secondary: _base.neutral400,
    onSecondary: _base.neutral50,
    secondaryContainer: _base.neutral800,
    onSecondaryContainer: _base.neutral100,
    tertiary: _base.teal400,
    onTertiary: _base.teal900,
    tertiaryContainer: _base.teal900,
    onTertiaryContainer: _base.teal100,
    error: _base.red400,
    onError: _base.red900,
    errorContainer: _base.red900,
    onErrorContainer: _base.red100,
    outline: _base.neutral700,
    outlineVariant: _base.neutral700,
    surfaceContainer: _base.neutral900,
    surfaceContainerHighest: _base.neutral800,
    surfaceContainerLow: _base.neutral800,
    surfaceContainerLowest: _base.neutral900,
    surface: _base.neutral900,
    inverseSurface: _base.neutral50,
    inverseOnSurface: _base.neutral900,
    inversePrimary: _base.blue500,
    scrim: _base.neutral900.withAlpha(0x80),
    surfaceTint: null,
    shadow: null,
  );

  @override
  DsColorScheme copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? outline,
    Color? outlineVariant,
    Color? surfaceContainer,
    Color? surfaceContainerHighest,
    Color? surfaceContainerLow,
    Color? surfaceContainerLowest,
    Color? surface,
    Color? inverseSurface,
    Color? inverseOnSurface,
    Color? inversePrimary,
    Color? scrim,
    Color? surfaceTint,
    Color? shadow,
  }) {
    return DsColorScheme(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHighest: surfaceContainerHighest ?? this.surfaceContainerHighest,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainerLowest: surfaceContainerLowest ?? this.surfaceContainerLowest,
      surface: surface ?? this.surface,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      inverseOnSurface: inverseOnSurface ?? this.inverseOnSurface,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      scrim: scrim ?? this.scrim,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  DsColorScheme lerp(covariant ThemeExtension<DsColorScheme> other, double t) {
    if (other is! DsColorScheme) return this;
    return DsColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer: Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimaryContainer: Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      secondaryContainer: Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
      onSecondaryContainer: Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      tertiaryContainer: Color.lerp(tertiaryContainer, other.tertiaryContainer, t)!,
      onTertiaryContainer: Color.lerp(onTertiaryContainer, other.onTertiaryContainer, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer: Color.lerp(onErrorContainer, other.onErrorContainer, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      outlineVariant: other.outlineVariant,
      surfaceContainer: Color.lerp(surfaceContainer, other.surfaceContainer, t)!,
      surfaceContainerHighest: Color.lerp(surfaceContainerHighest, other.surfaceContainerHighest, t)!,
      surfaceContainerLow: Color.lerp(surfaceContainerLow, other.surfaceContainerLow, t)!,
      surfaceContainerLowest: Color.lerp(surfaceContainerLowest, other.surfaceContainerLowest, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      inverseSurface: Color.lerp(inverseSurface, other.inverseSurface, t)!,
      inverseOnSurface: Color.lerp(inverseOnSurface, other.inverseOnSurface, t)!,
      inversePrimary: Color.lerp(inversePrimary, other.inversePrimary, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
      surfaceTint: other.surfaceTint,
      shadow: other.shadow,
    );
  }
}
