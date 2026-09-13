import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

class DsSnackBar {
  DsSnackBar._();

  static void show(
    BuildContext context, {
    required String message,
    IconData? trailingActionIcon,
    VoidCallback? onTrailingActionPressed,
    String? trailingActionLabel,
    Color? backgroundColor,
    Color? textColor,
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 4),
    double width = 280,
    EdgeInsetsGeometry? padding,
    ShapeBorder? shape,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    Animation<double>? animation,
    DismissDirection dismissDirection = DismissDirection.horizontal,
    bool showCloseIcon = false,
  }) {
    final colors = context.dsColors;
    final type = context.dsType;
    final effectiveBg = backgroundColor ?? colors.backgroundSurface;
    final effectiveText = textColor ?? colors.textPrimary;

    final Widget content = Row(
      children: [
        Expanded(
          child: Text(
            message,
            style: type.bodyMedium.copyWith(color: effectiveText),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (trailingActionIcon != null && onTrailingActionPressed != null) ...[
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(trailingActionIcon, color: effectiveText, size: 20),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              onTrailingActionPressed();
            },
            tooltip: trailingActionLabel,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            padding: EdgeInsets.zero,
          ),
        ],
      ],
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content,
        backgroundColor: effectiveBg,
        action: action,
        duration: duration,
        width: width,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: shape,
        behavior: behavior,
        animation: animation,
        dismissDirection: dismissDirection,
        showCloseIcon: showCloseIcon,
        closeIconColor: effectiveText,
      ),
    );
  }
}
