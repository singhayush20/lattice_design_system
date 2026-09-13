import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

part 'base_modal_dialog.dart';
part 'ds_modal_dialog_style.dart';

final class DsModalDialog extends BaseModalDialog {
  const DsModalDialog._({
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

  static Future<T?> showModalDialog<T>({
    required BuildContext context,
    required DsDialogTitle title,
    required DsDialogDescription description,
    DsDialogIcon? primaryIcon,
    String? primaryButtonText,
    VoidCallback? onPrimaryButtonPressed,
    String? secondaryButtonText,
    VoidCallback? onSecondaryButtonPressed,
    VoidCallback? onClosePressed,
    bool isDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) => DsModalDialog._(
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
