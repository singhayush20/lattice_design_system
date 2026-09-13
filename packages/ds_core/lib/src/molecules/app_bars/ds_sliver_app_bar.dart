import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

class DsSliverAppBar extends StatelessWidget {
  const DsSliverAppBar({
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
    this.pinned = false,
    this.floating = false,
    this.snap = false,
    this.expandedHeight,
    this.flexibleSpace,
    this.stretch = false,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
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
  final bool pinned;
  final bool floating;
  final bool snap;
  final double? expandedHeight;
  final Widget? flexibleSpace;
  final bool stretch;
  final double stretchTriggerOffset;
  final Future<void> Function()? onStretchTrigger;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final type = context.dsType;
    final effectiveBg = backgroundColor ?? colors.backgroundSurface;
    final effectiveFg = foregroundColor ?? colors.textPrimary;

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

    return SliverAppBar(
      title: titleWidget,
      leading: leadingWidget,
      automaticallyImplyLeading: false,
      actions: actions,
      backgroundColor: effectiveBg,
      foregroundColor: effectiveFg,
      elevation: elevation,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing,
      toolbarHeight: toolbarHeight ?? kToolbarHeight,
      pinned: pinned,
      floating: floating,
      snap: snap,
      expandedHeight: expandedHeight,
      flexibleSpace: flexibleSpace,
      stretch: stretch,
      stretchTriggerOffset: stretchTriggerOffset,
      onStretchTrigger: onStretchTrigger,
      shape: showBottomBorder
          ? Border(bottom: BorderSide(color: colors.dividerColor, width: 1))
          : null,
    );
  }
}
