import 'package:flutter/material.dart';
import 'ds_theme_mode_controller.dart';

class DsThemeScope extends InheritedNotifier<DsThemeModeController> {
  const DsThemeScope({
    super.key,
    required DsThemeModeController controller,
    required super.child,
  }) : super(notifier: controller);

  static DsThemeModeController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<DsThemeScope>();
    if (scope == null) {
      throw FlutterError('DsThemeScope not found in context');
    }
    return scope.notifier!;
  }

  static DsThemeModeController? maybeOf(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<DsThemeScope>();
    return scope?.notifier;
  }
}
