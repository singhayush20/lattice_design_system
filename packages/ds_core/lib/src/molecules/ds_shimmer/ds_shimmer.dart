import 'package:ds_core/ds_core.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class DsShimmer extends StatelessWidget {
  const DsShimmer({
    super.key,
    required this.child,
    this.enabled = true,
    this.color,
  });

  final Widget child;
  final bool enabled;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      color: color ?? context.dsColors.transparent,
      enabled: enabled,
      child: child,
    );
  }
}
