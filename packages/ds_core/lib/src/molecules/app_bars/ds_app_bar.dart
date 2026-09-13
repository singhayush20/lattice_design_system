import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

class DsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DsAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.backButtonRequired = true,
    this.onBackPressed,
    this.actions,
    this.showBottomBorder = false,
    this.elevation = 0,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = false,
    this.titleSpacing,
    this.toolbarHeight,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.bottom,
    this.shape,
    this.scrolledUnderElevation,
    this.surfaceTintColor,
    this.shadowColor,
    this.forceMaterialTransparency = false,
  });

  final String? title;
  final String? subtitle;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final bool backButtonRequired;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool showBottomBorder;
  final double elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool centerTitle;
  final double? titleSpacing;
  final double? toolbarHeight;
  final double toolbarOpacity;
  final double bottomOpacity;
  final PreferredSizeWidget? bottom;
  final ShapeBorder? shape;
  final double? scrolledUnderElevation;
  final Color? surfaceTintColor;
  final Color? shadowColor;
  final bool forceMaterialTransparency;

  @override
  Size get preferredSize => Size.fromHeight(
    toolbarHeight ?? kToolbarHeight + (bottom?.preferredSize.height ?? 0),
  );

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final type = context.dsType;
    final effectiveBg = backgroundColor ?? colors.backgroundSurface;
    final effectiveFg = foregroundColor ?? colors.textPrimary;
    final effectiveElevation = elevation;

    Widget? leadingWidget = leading;
    if (automaticallyImplyLeading &&
        leadingWidget == null &&
        backButtonRequired) {
      leadingWidget = IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: effectiveFg, size: 20),
        onPressed: onBackPressed ?? () => Navigator.maybePop(context),
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      );
    }

    final List<Widget> titleWidgets = [];
    if (title != null) {
      titleWidgets.add(
        Text(title!, style: type.titleLarge.copyWith(color: effectiveFg)),
      );
    }
    if (subtitle != null) {
      if (titleWidgets.isNotEmpty) {
        titleWidgets.add(const SizedBox(height: 2));
      }
      titleWidgets.add(
        Text(
          subtitle!,
          style: type.titleMedium.copyWith(color: colors.textSecondary),
        ),
      );
    }

    Widget? titleWidget;
    if (titleWidgets.isNotEmpty) {
      titleWidget = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: centerTitle
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: titleWidgets,
      );
    }

    return AppBar(
      title: titleWidget,
      leading: leadingWidget,
      automaticallyImplyLeading: false,
      actions: actions,
      backgroundColor: effectiveBg,
      foregroundColor: effectiveFg,
      elevation: effectiveElevation,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing,
      toolbarHeight: toolbarHeight,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      bottom: bottom,
      shape:
          shape ??
          (showBottomBorder
              ? Border(bottom: BorderSide(color: colors.dividerColor, width: 1))
              : null),
      scrolledUnderElevation: scrolledUnderElevation,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      forceMaterialTransparency: forceMaterialTransparency,
    );
  }
}
