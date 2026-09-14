import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';



@UseCase(name: 'Modal Dialog', type: DsButton, path: '[Molecules]/Dialogs')
Widget modalDialogUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Confirm Action',
  );
  final description = context.knobs.string(
    label: 'Description',
    initialValue:
        'Are you sure you want to proceed? This action cannot be undone.',
  );
  final isDismissible = context.knobs.boolean(
    label: 'Dismissible',
    initialValue: true,
  );
  final primaryButtonText = context.knobs.stringOrNull(
    label: 'Primary Button Text',
    initialValue: 'Confirm',
  );
  final secondaryButtonText = context.knobs.stringOrNull(
    label: 'Secondary Button Text',
    initialValue: 'Cancel',
  );
  final showPrimaryIcon = context.knobs.boolean(
    label: 'Show Primary Icon',
    initialValue: false,
  );

  return Center(
    child: DsButton.primary(
      'Show Dialog',
      onTap: () {
        DsModalDialog.showModalDialog(
          context: context,
          title: DsDialogTitle.text(title),
          description: DsDialogDescription.text(description),
          isDismissible: isDismissible,
          primaryButtonText: primaryButtonText,
          secondaryButtonText: secondaryButtonText,
          primaryIcon: showPrimaryIcon
              ? DsDialogIcon.icon(Icons.warning_amber_rounded)
              : null,
          onPrimaryButtonPressed: () {
            Navigator.of(context).pop();
            debugPrint('Dialog primary action');
          },
          onSecondaryButtonPressed: () {
            Navigator.of(context).pop();
            debugPrint('Dialog secondary action');
          },
        );
      },
    ),
  );
}

@UseCase(
  name: 'Dialog - No Secondary Button',
  type: DsButton,
  path: '[Molecules]/Dialogs',
)
Widget modalDialogNoSecondaryUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Information',
  );
  final description = context.knobs.string(
    label: 'Description',
    initialValue: 'This is an informational dialog with only a primary action.',
  );
  final isDismissible = context.knobs.boolean(
    label: 'Dismissible',
    initialValue: true,
  );
  final primaryButtonText = context.knobs.string(
    label: 'Primary Button Text',
    initialValue: 'Got it',
  );

  return Center(
    child: DsButton.primary(
      'Show Info Dialog',
      onTap: () {
        DsModalDialog.showModalDialog(
          context: context,
          title: DsDialogTitle.text(title),
          description: DsDialogDescription.text(description),
          isDismissible: isDismissible,
          primaryButtonText: primaryButtonText,
          onPrimaryButtonPressed: () {
            Navigator.of(context).pop();
            debugPrint('Dialog acknowledged');
          },
        );
      },
    ),
  );
}

@UseCase(
  name: 'Dialog - Custom Icon',
  type: DsButton,
  path: '[Molecules]/Dialogs',
)
Widget modalDialogCustomIconUseCase(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Success!');
  final description = context.knobs.string(
    label: 'Description',
    initialValue: 'Your changes have been saved successfully.',
  );
  final isDismissible = context.knobs.boolean(
    label: 'Dismissible',
    initialValue: true,
  );
  final primaryButtonText = context.knobs.string(
    label: 'Primary Button Text',
    initialValue: 'Continue',
  );

  return Center(
    child: DsButton.primary(
      'Show Success Dialog',
      onTap: () {
        DsModalDialog.showModalDialog(
          context: context,
          title: DsDialogTitle.text(title),
          description: DsDialogDescription.text(description),
          isDismissible: isDismissible,
          primaryButtonText: primaryButtonText,
          primaryIcon: DsDialogIcon.icon(Icons.check_circle),
          onPrimaryButtonPressed: () {
            Navigator.of(context).pop();
            debugPrint('Success dialog acknowledged');
          },
        );
      },
    ),
  );
}
