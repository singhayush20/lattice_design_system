import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

part 'base_modal_bottom_sheet.dart';
part 'ds_modal_bottom_sheet_style.dart';

final class DsModalBottomSheet extends BaseModalBottomSheet {
  const DsModalBottomSheet._({
    required super.title,
    required super.description,
    super.primaryIcon,
    super.primaryButtonText,
    super.onPrimaryButtonPressed,
    super.secondaryButtonText,
    super.onSecondaryButtonPressed,
    super.onClosePressed,
    super.isDismissible,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required DsBottomSheetTitle title,
    required DsBottomSheetDescription description,
    DsBottomSheetIcon? primaryIcon,
    String? primaryButtonText,
    VoidCallback? onPrimaryButtonPressed,
    String? secondaryButtonText,
    VoidCallback? onSecondaryButtonPressed,
    VoidCallback? onClosePressed,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      backgroundColor: Colors.transparent,
      builder: (context) => DsModalBottomSheet._(
        title: title,
        description: description,
        primaryIcon: primaryIcon,
        primaryButtonText: primaryButtonText,
        onPrimaryButtonPressed: onPrimaryButtonPressed,
        secondaryButtonText: secondaryButtonText,
        onSecondaryButtonPressed: onSecondaryButtonPressed,
        onClosePressed: onClosePressed,
        isDismissible: isDismissible,
      ),
    );
  }
}
