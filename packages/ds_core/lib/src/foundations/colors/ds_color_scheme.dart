import 'package:flutter/material.dart';
import 'base_colors.dart';

/// Semantic color scheme derived from base palette for light and dark modes.
class DsColorScheme extends ThemeExtension<DsColorScheme> {
  DsColorScheme({
    required this.primary,
    required this.primaryLight,
    required this.primaryDark,
    required this.secondary,
    required this.secondaryLight,
    required this.secondaryDark,
    required this.onPrimary,
    required this.onSecondary,
    required this.backgroundPrimary,
    required this.backgroundSurface,
    required this.backgroundSubtle,
    required this.backgroundSuccess,
    required this.backgroundEnabled,
    required this.backgroundWarning,
    required this.backgroundError,
    required this.backgroundInfo,
    required this.backgroundDisabled,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.textOnDark,
    required this.textLink,
    required this.textSuccess,
    required this.textWarning,
    required this.textError,
    required this.textAccent,
    required this.borderDefault,
    required this.borderDefaultSecondary,
    required this.borderSubtle,
    required this.borderDisabled,
    required this.borderPrimary,
    required this.borderSuccess,
    required this.borderWarning,
    required this.borderError,
    required this.borderInfo,
    required this.buttonPrimary,
    required this.buttonPrimaryHover,
    required this.buttonPrimaryDisabled,
    required this.buttonPrimaryText,
    required this.buttonPrimaryTextDisabled,
    required this.buttonPrimaryPressed,
    required this.buttonSecondary,
    required this.buttonSecondaryBorder,
    required this.buttonSecondaryText,
    required this.buttonSecondaryHover,
    required this.buttonSecondaryDisabled,
    required this.buttonSecondaryPressed,
    required this.buttonSecondaryBorderDisabled,
    required this.buttonTertiaryText,
    required this.buttonTertiaryHover,
    required this.buttonDestructive,
    required this.buttonDestructiveHover,
    required this.buttonDestructiveDisabled,
    required this.buttonDestructiveText,
    required this.textFieldBackground,
    required this.textFieldText,
    required this.textFieldBorder,
    required this.textFieldBorderFocused,
    required this.textFieldBorderHover,
    required this.textFieldBorderDisabled,
    required this.textFieldBorderError,
    required this.textFieldBorderSuccess,
    required this.textFieldBackgroundDisabled,
    required this.textFieldTextDisabled,
    required this.textFieldHint,
    required this.textFieldCursor,
    required this.textFieldCursorError,
    required this.textFieldLabel,
    required this.textFieldLabelFocused,
    required this.textFieldHelper,
    required this.textFieldErrorText,
    required this.textFieldSuccessText,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.iconDisabled,
    required this.iconOnPrimary,
    required this.iconSuccess,
    required this.iconWarning,
    required this.iconError,
    required this.iconInfo,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.navigationBarShadow,
    required this.overlayColor,
    required this.dividerColor,
    required this.dividerColorSecondary,
    required this.transparent,
    required this.white,
    required this.black,
    required this.gradientStart,
    required this.gradientEnd,
    required this.loadingIndicatorColorPrimary,
  }) : super();

  final Color primary;
  final Color primaryLight;
  final Color primaryDark;
  final Color secondary;
  final Color secondaryLight;
  final Color secondaryDark;
  final Color onPrimary;
  final Color onSecondary;
  final Color backgroundPrimary;
  final Color backgroundSurface;
  final Color backgroundSubtle;
  final Color backgroundSuccess;
  final Color backgroundEnabled;
  final Color backgroundWarning;
  final Color backgroundError;
  final Color backgroundInfo;
  final Color backgroundDisabled;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color textOnDark;
  final Color textLink;
  final Color textSuccess;
  final Color textWarning;
  final Color textError;
  final Color textAccent;
  final Color borderDefault;
  final Color borderDefaultSecondary;
  final Color borderSubtle;
  final Color borderDisabled;
  final Color borderPrimary;
  final Color borderSuccess;
  final Color borderWarning;
  final Color borderError;
  final Color borderInfo;
  final Color buttonPrimary;
  final Color buttonPrimaryHover;
  final Color buttonPrimaryDisabled;
  final Color buttonPrimaryText;
  final Color buttonPrimaryTextDisabled;
  final Color buttonPrimaryPressed;
  final Color buttonSecondary;
  final Color buttonSecondaryBorder;
  final Color buttonSecondaryText;
  final Color buttonSecondaryHover;
  final Color buttonSecondaryDisabled;
  final Color buttonSecondaryPressed;
  final Color buttonSecondaryBorderDisabled;
  final Color buttonTertiaryText;
  final Color buttonTertiaryHover;
  final Color buttonDestructive;
  final Color buttonDestructiveHover;
  final Color buttonDestructiveDisabled;
  final Color buttonDestructiveText;
  final Color textFieldBackground;
  final Color textFieldText;
  final Color textFieldBorder;
  final Color textFieldBorderFocused;
  final Color textFieldBorderHover;
  final Color textFieldBorderDisabled;
  final Color textFieldBorderError;
  final Color textFieldBorderSuccess;
  final Color textFieldBackgroundDisabled;
  final Color textFieldTextDisabled;
  final Color textFieldHint;
  final Color textFieldCursor;
  final Color textFieldCursorError;
  final Color textFieldLabel;
  final Color textFieldLabelFocused;
  final Color textFieldHelper;
  final Color textFieldErrorText;
  final Color textFieldSuccessText;
  final Color iconPrimary;
  final Color iconSecondary;
  final Color iconDisabled;
  final Color iconOnPrimary;
  final Color iconSuccess;
  final Color iconWarning;
  final Color iconError;
  final Color iconInfo;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color navigationBarShadow;
  final Color overlayColor;
  final Color dividerColor;
  final Color dividerColorSecondary;
  final Color transparent;
  final Color white;
  final Color black;
  final Color gradientStart;
  final Color gradientEnd;
  final Color loadingIndicatorColorPrimary;

  static const _base = baseColors;

  static DsColorScheme light() => DsColorScheme(
    primary: _base.blue500,
    primaryLight: _base.blue400,
    primaryDark: _base.blue600,
    secondary: _base.neutral600,
    secondaryLight: _base.neutral500,
    secondaryDark: _base.neutral700,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    backgroundPrimary: Colors.white,
    backgroundSurface: _base.neutral50,
    backgroundSubtle: _base.neutral100,
    backgroundSuccess: _base.green50,
    backgroundEnabled: _base.blue500,
    backgroundWarning: _base.yellow50,
    backgroundError: _base.red50,
    backgroundInfo: _base.blue50,
    backgroundDisabled: _base.neutral200,
    textPrimary: _base.neutral900,
    textSecondary: _base.neutral600,
    textTertiary: _base.neutral400,
    textDisabled: _base.neutral300,
    textOnDark: _base.neutral50,
    textLink: _base.blue500,
    textSuccess: _base.green600,
    textWarning: _base.yellow600,
    textError: _base.red600,
    textAccent: _base.purple500,
    borderDefault: _base.neutral300,
    borderDefaultSecondary: _base.neutral200,
    borderSubtle: _base.neutral100,
    borderDisabled: _base.neutral300.withAlpha(0x40),
    borderPrimary: _base.blue500,
    borderSuccess: _base.green500,
    borderWarning: _base.yellow500,
    borderError: _base.red500,
    borderInfo: _base.blue500,
    buttonPrimary: _base.blue500,
    buttonPrimaryHover: _base.blue400,
    buttonPrimaryDisabled: _base.blue200,
    buttonPrimaryText: Colors.white,
    buttonPrimaryTextDisabled: _base.neutral300,
    buttonPrimaryPressed: _base.blue600,
    buttonSecondary: Colors.transparent,
    buttonSecondaryBorder: _base.neutral300,
    buttonSecondaryText: _base.blue500,
    buttonSecondaryHover: _base.neutral100,
    buttonSecondaryDisabled: Colors.transparent,
    buttonSecondaryPressed: _base.neutral200,
    buttonSecondaryBorderDisabled: _base.neutral300.withAlpha(0x40),
    buttonTertiaryText: _base.blue500,
    buttonTertiaryHover: _base.neutral100,
    buttonDestructive: _base.red500,
    buttonDestructiveHover: _base.red400,
    buttonDestructiveDisabled: _base.red200,
    buttonDestructiveText: Colors.white,
    textFieldBackground: Colors.white,
    textFieldText: _base.neutral900,
    textFieldBorder: _base.neutral300,
    textFieldBorderFocused: _base.blue500,
    textFieldBorderHover: _base.neutral400,
    textFieldBorderDisabled: _base.neutral200,
    textFieldBorderError: _base.red500,
    textFieldBorderSuccess: _base.green500,
    textFieldBackgroundDisabled: _base.neutral100,
    textFieldTextDisabled: _base.neutral400,
    textFieldHint: _base.neutral400,
    textFieldCursor: _base.blue500,
    textFieldCursorError: _base.red500,
    textFieldLabel: _base.neutral600,
    textFieldLabelFocused: _base.blue500,
    textFieldHelper: _base.neutral500,
    textFieldErrorText: _base.red500,
    textFieldSuccessText: _base.green600,
    iconPrimary: _base.neutral900,
    iconSecondary: _base.neutral500,
    iconDisabled: _base.neutral300,
    iconOnPrimary: Colors.white,
    iconSuccess: _base.green600,
    iconWarning: _base.yellow600,
    iconError: _base.red600,
    iconInfo: _base.blue600,
    success: _base.green500,
    warning: _base.yellow500,
    error: _base.red500,
    info: _base.blue500,
    navigationBarShadow: _base.neutral900.withAlpha(0x10),
    overlayColor: _base.neutral900.withAlpha(0x60),
    dividerColor: _base.neutral300,
    dividerColorSecondary: _base.neutral200,
    transparent: Colors.transparent,
    white: Colors.white,
    black: Colors.black,
    gradientStart: _base.blue500,
    gradientEnd: _base.purple500,
    loadingIndicatorColorPrimary: _base.blue500,
  );

  static DsColorScheme dark() => DsColorScheme(
    primary: _base.blue400,
    primaryLight: _base.blue300,
    primaryDark: _base.blue500,
    secondary: _base.neutral400,
    secondaryLight: _base.neutral300,
    secondaryDark: _base.neutral500,
    onPrimary: _base.blue900,
    onSecondary: _base.neutral900,
    backgroundPrimary: _base.neutral900,
    backgroundSurface: _base.neutral800,
    backgroundSubtle: _base.neutral700,
    backgroundSuccess: _base.green900,
    backgroundEnabled: _base.blue400,
    backgroundWarning: _base.yellow900,
    backgroundError: _base.red900,
    backgroundInfo: _base.blue900,
    backgroundDisabled: _base.neutral800,
    textPrimary: _base.neutral50,
    textSecondary: _base.neutral400,
    textTertiary: _base.neutral300,
    textDisabled: _base.neutral500,
    textOnDark: _base.neutral50,
    textLink: _base.blue400,
    textSuccess: _base.green400,
    textWarning: _base.yellow400,
    textError: _base.red400,
    textAccent: _base.purple400,
    borderDefault: _base.neutral700,
    borderDefaultSecondary: _base.neutral600,
    borderSubtle: _base.neutral600,
    borderDisabled: _base.neutral700.withAlpha(0x40),
    borderPrimary: _base.blue400,
    borderSuccess: _base.green400,
    borderWarning: _base.yellow400,
    borderError: _base.red400,
    borderInfo: _base.blue400,
    buttonPrimary: _base.blue400,
    buttonPrimaryHover: _base.blue300,
    buttonPrimaryDisabled: _base.blue800,
    buttonPrimaryText: _base.blue900,
    buttonPrimaryTextDisabled: _base.neutral500,
    buttonPrimaryPressed: _base.blue500,
    buttonSecondary: Colors.transparent,
    buttonSecondaryBorder: _base.neutral700,
    buttonSecondaryText: _base.blue400,
    buttonSecondaryHover: _base.neutral800,
    buttonSecondaryDisabled: Colors.transparent,
    buttonSecondaryPressed: _base.neutral600,
    buttonSecondaryBorderDisabled: _base.neutral700.withAlpha(0x40),
    buttonTertiaryText: _base.blue400,
    buttonTertiaryHover: _base.neutral800,
    buttonDestructive: _base.red400,
    buttonDestructiveHover: _base.red300,
    buttonDestructiveDisabled: _base.red800,
    buttonDestructiveText: _base.white,
    textFieldBackground: _base.neutral800,
    textFieldText: _base.neutral50,
    textFieldBorder: _base.neutral700,
    textFieldBorderFocused: _base.blue400,
    textFieldBorderHover: _base.neutral600,
    textFieldBorderDisabled: _base.neutral800,
    textFieldBorderError: _base.red400,
    textFieldBorderSuccess: _base.green400,
    textFieldBackgroundDisabled: _base.neutral700,
    textFieldTextDisabled: _base.neutral500,
    textFieldHint: _base.neutral500,
    textFieldCursor: _base.blue400,
    textFieldCursorError: _base.red400,
    textFieldLabel: _base.neutral400,
    textFieldLabelFocused: _base.blue400,
    textFieldHelper: _base.neutral400,
    textFieldErrorText: _base.red400,
    textFieldSuccessText: _base.green400,
    iconPrimary: _base.neutral50,
    iconSecondary: _base.neutral400,
    iconDisabled: _base.neutral600,
    iconOnPrimary: _base.blue900,
    iconSuccess: _base.green400,
    iconWarning: _base.yellow400,
    iconError: _base.red400,
    iconInfo: _base.blue400,
    success: _base.green400,
    warning: _base.yellow400,
    error: _base.red400,
    info: _base.blue400,
    navigationBarShadow: _base.black.withAlpha(0x20),
    overlayColor: _base.black.withAlpha(0x66),
    dividerColor: _base.neutral700,
    dividerColorSecondary: _base.neutral600,
    transparent: Colors.transparent,
    white: Colors.white,
    black: Colors.black,
    gradientStart: _base.blue400,
    gradientEnd: _base.purple400,
    loadingIndicatorColorPrimary: _base.blue400,
  );

  @override
  DsColorScheme copyWith({
    Color? primary,
    Color? primaryLight,
    Color? primaryDark,
    Color? secondary,
    Color? secondaryLight,
    Color? secondaryDark,
    Color? onPrimary,
    Color? onSecondary,
    Color? backgroundPrimary,
    Color? backgroundSurface,
    Color? backgroundSubtle,
    Color? backgroundSuccess,
    Color? backgroundEnabled,
    Color? backgroundWarning,
    Color? backgroundError,
    Color? backgroundInfo,
    Color? backgroundDisabled,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? textOnDark,
    Color? textLink,
    Color? textSuccess,
    Color? textWarning,
    Color? textError,
    Color? textAccent,
    Color? borderDefault,
    Color? borderDefaultSecondary,
    Color? borderSubtle,
    Color? borderDisabled,
    Color? borderPrimary,
    Color? borderSuccess,
    Color? borderWarning,
    Color? borderError,
    Color? borderInfo,
    Color? buttonPrimary,
    Color? buttonPrimaryHover,
    Color? buttonPrimaryDisabled,
    Color? buttonPrimaryText,
    Color? buttonPrimaryTextDisabled,
    Color? buttonPrimaryPressed,
    Color? buttonSecondary,
    Color? buttonSecondaryBorder,
    Color? buttonSecondaryText,
    Color? buttonSecondaryHover,
    Color? buttonSecondaryDisabled,
    Color? buttonSecondaryPressed,
    Color? buttonSecondaryBorderDisabled,
    Color? buttonTertiaryText,
    Color? buttonTertiaryHover,
    Color? buttonDestructive,
    Color? buttonDestructiveHover,
    Color? buttonDestructiveDisabled,
    Color? buttonDestructiveText,
    Color? textFieldBackground,
    Color? textFieldText,
    Color? textFieldBorder,
    Color? textFieldBorderFocused,
    Color? textFieldBorderHover,
    Color? textFieldBorderDisabled,
    Color? textFieldBorderError,
    Color? textFieldBorderSuccess,
    Color? textFieldBackgroundDisabled,
    Color? textFieldTextDisabled,
    Color? textFieldHint,
    Color? textFieldCursor,
    Color? textFieldCursorError,
    Color? textFieldLabel,
    Color? textFieldLabelFocused,
    Color? textFieldHelper,
    Color? textFieldErrorText,
    Color? textFieldSuccessText,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? iconDisabled,
    Color? iconOnPrimary,
    Color? iconSuccess,
    Color? iconWarning,
    Color? iconError,
    Color? iconInfo,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? navigationBarShadow,
    Color? overlayColor,
    Color? dividerColor,
    Color? dividerColorSecondary,
    Color? transparent,
    Color? white,
    Color? black,
    Color? gradientStart,
    Color? gradientEnd,
    Color? loadingIndicatorColorPrimary,
  }) {
    return DsColorScheme(
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryDark: primaryDark ?? this.primaryDark,
      secondary: secondary ?? this.secondary,
      secondaryLight: secondaryLight ?? this.secondaryLight,
      secondaryDark: secondaryDark ?? this.secondaryDark,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSurface: backgroundSurface ?? this.backgroundSurface,
      backgroundSubtle: backgroundSubtle ?? this.backgroundSubtle,
      backgroundSuccess: backgroundSuccess ?? this.backgroundSuccess,
      backgroundEnabled: backgroundEnabled ?? this.backgroundEnabled,
      backgroundWarning: backgroundWarning ?? this.backgroundWarning,
      backgroundError: backgroundError ?? this.backgroundError,
      backgroundInfo: backgroundInfo ?? this.backgroundInfo,
      backgroundDisabled: backgroundDisabled ?? this.backgroundDisabled,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textDisabled: textDisabled ?? this.textDisabled,
      textOnDark: textOnDark ?? this.textOnDark,
      textLink: textLink ?? this.textLink,
      textSuccess: textSuccess ?? this.textSuccess,
      textWarning: textWarning ?? this.textWarning,
      textError: textError ?? this.textError,
      textAccent: textAccent ?? this.textAccent,
      borderDefault: borderDefault ?? this.borderDefault,
      borderDefaultSecondary:
          borderDefaultSecondary ?? this.borderDefaultSecondary,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      borderDisabled: borderDisabled ?? this.borderDisabled,
      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderSuccess: borderSuccess ?? this.borderSuccess,
      borderWarning: borderWarning ?? this.borderWarning,
      borderError: borderError ?? this.borderError,
      borderInfo: borderInfo ?? this.borderInfo,
      buttonPrimary: buttonPrimary ?? this.buttonPrimary,
      buttonPrimaryHover: buttonPrimaryHover ?? this.buttonPrimaryHover,
      buttonPrimaryDisabled:
          buttonPrimaryDisabled ?? this.buttonPrimaryDisabled,
      buttonPrimaryText: buttonPrimaryText ?? this.buttonPrimaryText,
      buttonPrimaryTextDisabled:
          buttonPrimaryTextDisabled ?? this.buttonPrimaryTextDisabled,
      buttonPrimaryPressed: buttonPrimaryPressed ?? this.buttonPrimaryPressed,
      buttonSecondary: buttonSecondary ?? this.buttonSecondary,
      buttonSecondaryBorder:
          buttonSecondaryBorder ?? this.buttonSecondaryBorder,
      buttonSecondaryText: buttonSecondaryText ?? this.buttonSecondaryText,
      buttonSecondaryHover: buttonSecondaryHover ?? this.buttonSecondaryHover,
      buttonSecondaryDisabled:
          buttonSecondaryDisabled ?? this.buttonSecondaryDisabled,
      buttonSecondaryPressed:
          buttonSecondaryPressed ?? this.buttonSecondaryPressed,
      buttonSecondaryBorderDisabled:
          buttonSecondaryBorderDisabled ?? this.buttonSecondaryBorderDisabled,
      buttonTertiaryText: buttonTertiaryText ?? this.buttonTertiaryText,
      buttonTertiaryHover: buttonTertiaryHover ?? this.buttonTertiaryHover,
      buttonDestructive: buttonDestructive ?? this.buttonDestructive,
      buttonDestructiveHover:
          buttonDestructiveHover ?? this.buttonDestructiveHover,
      buttonDestructiveDisabled:
          buttonDestructiveDisabled ?? this.buttonDestructiveDisabled,
      buttonDestructiveText:
          buttonDestructiveText ?? this.buttonDestructiveText,
      textFieldBackground: textFieldBackground ?? this.textFieldBackground,
      textFieldText: textFieldText ?? this.textFieldText,
      textFieldBorder: textFieldBorder ?? this.textFieldBorder,
      textFieldBorderFocused:
          textFieldBorderFocused ?? this.textFieldBorderFocused,
      textFieldBorderHover: textFieldBorderHover ?? this.textFieldBorderHover,
      textFieldBorderDisabled:
          textFieldBorderDisabled ?? this.textFieldBorderDisabled,
      textFieldBorderError: textFieldBorderError ?? this.textFieldBorderError,
      textFieldBorderSuccess:
          textFieldBorderSuccess ?? this.textFieldBorderSuccess,
      textFieldBackgroundDisabled:
          textFieldBackgroundDisabled ?? this.textFieldBackgroundDisabled,
      textFieldTextDisabled:
          textFieldTextDisabled ?? this.textFieldTextDisabled,
      textFieldHint: textFieldHint ?? this.textFieldHint,
      textFieldCursor: textFieldCursor ?? this.textFieldCursor,
      textFieldCursorError: textFieldCursorError ?? this.textFieldCursorError,
      textFieldLabel: textFieldLabel ?? this.textFieldLabel,
      textFieldLabelFocused:
          textFieldLabelFocused ?? this.textFieldLabelFocused,
      textFieldHelper: textFieldHelper ?? this.textFieldHelper,
      textFieldErrorText: textFieldErrorText ?? this.textFieldErrorText,
      textFieldSuccessText: textFieldSuccessText ?? this.textFieldSuccessText,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      iconDisabled: iconDisabled ?? this.iconDisabled,
      iconOnPrimary: iconOnPrimary ?? this.iconOnPrimary,
      iconSuccess: iconSuccess ?? this.iconSuccess,
      iconWarning: iconWarning ?? this.iconWarning,
      iconError: iconError ?? this.iconError,
      iconInfo: iconInfo ?? this.iconInfo,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      navigationBarShadow: navigationBarShadow ?? this.navigationBarShadow,
      overlayColor: overlayColor ?? this.overlayColor,
      dividerColor: dividerColor ?? this.dividerColor,
      dividerColorSecondary:
          dividerColorSecondary ?? this.dividerColorSecondary,
      transparent: transparent ?? this.transparent,
      white: white ?? this.white,
      black: black ?? this.black,
      gradientStart: gradientStart ?? this.gradientStart,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      loadingIndicatorColorPrimary:
          loadingIndicatorColorPrimary ?? this.loadingIndicatorColorPrimary,
    );
  }

  @override
  DsColorScheme lerp(covariant ThemeExtension<DsColorScheme> other, double t) {
    if (other is! DsColorScheme) return this;
    return DsColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryLight: Color.lerp(secondaryLight, other.secondaryLight, t)!,
      secondaryDark: Color.lerp(secondaryDark, other.secondaryDark, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      backgroundPrimary: Color.lerp(
        backgroundPrimary,
        other.backgroundPrimary,
        t,
      )!,
      backgroundSurface: Color.lerp(
        backgroundSurface,
        other.backgroundSurface,
        t,
      )!,
      backgroundSubtle: Color.lerp(
        backgroundSubtle,
        other.backgroundSubtle,
        t,
      )!,
      backgroundSuccess: Color.lerp(
        backgroundSuccess,
        other.backgroundSuccess,
        t,
      )!,
      backgroundEnabled: Color.lerp(
        backgroundEnabled,
        other.backgroundEnabled,
        t,
      )!,
      backgroundWarning: Color.lerp(
        backgroundWarning,
        other.backgroundWarning,
        t,
      )!,
      backgroundError: Color.lerp(backgroundError, other.backgroundError, t)!,
      backgroundInfo: Color.lerp(backgroundInfo, other.backgroundInfo, t)!,
      backgroundDisabled: Color.lerp(
        backgroundDisabled,
        other.backgroundDisabled,
        t,
      )!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textOnDark: Color.lerp(textOnDark, other.textOnDark, t)!,
      textLink: Color.lerp(textLink, other.textLink, t)!,
      textSuccess: Color.lerp(textSuccess, other.textSuccess, t)!,
      textWarning: Color.lerp(textWarning, other.textWarning, t)!,
      textError: Color.lerp(textError, other.textError, t)!,
      textAccent: Color.lerp(textAccent, other.textAccent, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      borderDefaultSecondary: Color.lerp(
        borderDefaultSecondary,
        other.borderDefaultSecondary,
        t,
      )!,
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t)!,
      borderDisabled: Color.lerp(borderDisabled, other.borderDisabled, t)!,
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t)!,
      borderSuccess: Color.lerp(borderSuccess, other.borderSuccess, t)!,
      borderWarning: Color.lerp(borderWarning, other.borderWarning, t)!,
      borderError: Color.lerp(borderError, other.borderError, t)!,
      borderInfo: Color.lerp(borderInfo, other.borderInfo, t)!,
      buttonPrimary: Color.lerp(buttonPrimary, other.buttonPrimary, t)!,
      buttonPrimaryHover: Color.lerp(
        buttonPrimaryHover,
        other.buttonPrimaryHover,
        t,
      )!,
      buttonPrimaryDisabled: Color.lerp(
        buttonPrimaryDisabled,
        other.buttonPrimaryDisabled,
        t,
      )!,
      buttonPrimaryText: Color.lerp(
        buttonPrimaryText,
        other.buttonPrimaryText,
        t,
      )!,
      buttonPrimaryTextDisabled: Color.lerp(
        buttonPrimaryTextDisabled,
        other.buttonPrimaryTextDisabled,
        t,
      )!,
      buttonPrimaryPressed: Color.lerp(
        buttonPrimaryPressed,
        other.buttonPrimaryPressed,
        t,
      )!,
      buttonSecondary: Color.lerp(buttonSecondary, other.buttonSecondary, t)!,
      buttonSecondaryBorder: Color.lerp(
        buttonSecondaryBorder,
        other.buttonSecondaryBorder,
        t,
      )!,
      buttonSecondaryText: Color.lerp(
        buttonSecondaryText,
        other.buttonSecondaryText,
        t,
      )!,
      buttonSecondaryHover: Color.lerp(
        buttonSecondaryHover,
        other.buttonSecondaryHover,
        t,
      )!,
      buttonSecondaryDisabled: Color.lerp(
        buttonSecondaryDisabled,
        other.buttonSecondaryDisabled,
        t,
      )!,
      buttonSecondaryPressed: Color.lerp(
        buttonSecondaryPressed,
        other.buttonSecondaryPressed,
        t,
      )!,
      buttonSecondaryBorderDisabled: Color.lerp(
        buttonSecondaryBorderDisabled,
        other.buttonSecondaryBorderDisabled,
        t,
      )!,
      buttonTertiaryText: Color.lerp(
        buttonTertiaryText,
        other.buttonTertiaryText,
        t,
      )!,
      buttonTertiaryHover: Color.lerp(
        buttonTertiaryHover,
        other.buttonTertiaryHover,
        t,
      )!,
      buttonDestructive: Color.lerp(
        buttonDestructive,
        other.buttonDestructive,
        t,
      )!,
      buttonDestructiveHover: Color.lerp(
        buttonDestructiveHover,
        other.buttonDestructiveHover,
        t,
      )!,
      buttonDestructiveDisabled: Color.lerp(
        buttonDestructiveDisabled,
        other.buttonDestructiveDisabled,
        t,
      )!,
      buttonDestructiveText: Color.lerp(
        buttonDestructiveText,
        other.buttonDestructiveText,
        t,
      )!,
      textFieldBackground: Color.lerp(
        textFieldBackground,
        other.textFieldBackground,
        t,
      )!,
      textFieldText: Color.lerp(textFieldText, other.textFieldText, t)!,
      textFieldBorder: Color.lerp(textFieldBorder, other.textFieldBorder, t)!,
      textFieldBorderFocused: Color.lerp(
        textFieldBorderFocused,
        other.textFieldBorderFocused,
        t,
      )!,
      textFieldBorderHover: Color.lerp(
        textFieldBorderHover,
        other.textFieldBorderHover,
        t,
      )!,
      textFieldBorderDisabled: Color.lerp(
        textFieldBorderDisabled,
        other.textFieldBorderDisabled,
        t,
      )!,
      textFieldBorderError: Color.lerp(
        textFieldBorderError,
        other.textFieldBorderError,
        t,
      )!,
      textFieldBorderSuccess: Color.lerp(
        textFieldBorderSuccess,
        other.textFieldBorderSuccess,
        t,
      )!,
      textFieldBackgroundDisabled: Color.lerp(
        textFieldBackgroundDisabled,
        other.textFieldBackgroundDisabled,
        t,
      )!,
      textFieldTextDisabled: Color.lerp(
        textFieldTextDisabled,
        other.textFieldTextDisabled,
        t,
      )!,
      textFieldHint: Color.lerp(textFieldHint, other.textFieldHint, t)!,
      textFieldCursor: Color.lerp(textFieldCursor, other.textFieldCursor, t)!,
      textFieldCursorError: Color.lerp(
        textFieldCursorError,
        other.textFieldCursorError,
        t,
      )!,
      textFieldLabel: Color.lerp(textFieldLabel, other.textFieldLabel, t)!,
      textFieldLabelFocused: Color.lerp(
        textFieldLabelFocused,
        other.textFieldLabelFocused,
        t,
      )!,
      textFieldHelper: Color.lerp(textFieldHelper, other.textFieldHelper, t)!,
      textFieldErrorText: Color.lerp(
        textFieldErrorText,
        other.textFieldErrorText,
        t,
      )!,
      textFieldSuccessText: Color.lerp(
        textFieldSuccessText,
        other.textFieldSuccessText,
        t,
      )!,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t)!,
      iconDisabled: Color.lerp(iconDisabled, other.iconDisabled, t)!,
      iconOnPrimary: Color.lerp(iconOnPrimary, other.iconOnPrimary, t)!,
      iconSuccess: Color.lerp(iconSuccess, other.iconSuccess, t)!,
      iconWarning: Color.lerp(iconWarning, other.iconWarning, t)!,
      iconError: Color.lerp(iconError, other.iconError, t)!,
      iconInfo: Color.lerp(iconInfo, other.iconInfo, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
      navigationBarShadow: Color.lerp(
        navigationBarShadow,
        other.navigationBarShadow,
        t,
      )!,
      overlayColor: Color.lerp(overlayColor, other.overlayColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      dividerColorSecondary: Color.lerp(
        dividerColorSecondary,
        other.dividerColorSecondary,
        t,
      )!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      gradientStart: Color.lerp(gradientStart, other.gradientStart, t)!,
      gradientEnd: Color.lerp(gradientEnd, other.gradientEnd, t)!,
      loadingIndicatorColorPrimary: Color.lerp(
        loadingIndicatorColorPrimary,
        other.loadingIndicatorColorPrimary,
        t,
      )!,
    );
  }
}
