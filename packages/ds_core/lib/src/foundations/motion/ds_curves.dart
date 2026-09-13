import 'package:flutter/material.dart';

class DsCurves {
  DsCurves._();
  static const Curve standard = Curves.easeInOutCubic;
  static const Curve accelerate = Curves.easeInCubic;
  static const Curve decelerate = Curves.easeOutCubic;
  static const Curve linear = Curves.linear;
  static const Curve bounce = Curves.elasticOut;
}
