import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';



@UseCase(
  name: 'Modal Bottom Sheet',
  type: DsButton,
  path: '[Molecules]/Bottom Sheets',
)
Widget modalBottomSheetUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Share Options',
  );
  final description = context.knobs.string(
    label: 'Description',
    initialValue: 'Choose how you would like to share this content.',
  );
  final isDismissible = context.knobs.boolean(
    label: 'Dismissible',
    initialValue: true,
  );
  final primaryButtonText = context.knobs.stringOrNull(
    label: 'Primary Button Text',
    initialValue: 'Share Now',
  );
  final secondaryButtonText = context.knobs.stringOrNull(
    label: 'Secondary Button Text',
    initialValue: 'Copy Link',
  );
  final showPrimaryIcon = context.knobs.boolean(
    label: 'Show Primary Icon',
    initialValue: false,
  );

  return Center(
    child: DsButton.secondary(
      'Show Bottom Sheet',
      onTap: () {
        DsModalBottomSheet.show(
          context: context,
          title: DsBottomSheetTitle.text(title),
          description: DsBottomSheetDescription.text(description),
          isDismissible: isDismissible,
          primaryButtonText: primaryButtonText,
          secondaryButtonText: secondaryButtonText,
          primaryIcon: showPrimaryIcon
              ? DsBottomSheetIcon.icon(Icons.share)
              : null,
          onPrimaryButtonPressed: () {
            Navigator.of(context).pop();
            debugPrint('Bottom sheet primary action');
          },
          onSecondaryButtonPressed: () {
            Navigator.of(context).pop();
            debugPrint('Bottom sheet secondary action');
          },
        );
      },
    ),
  );
}

@UseCase(
  name: 'Bottom Sheet - Single Action',
  type: DsButton,
  path: '[Molecules]/Bottom Sheets',
)
Widget modalBottomSheetSingleActionUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Delete Item',
  );
  final description = context.knobs.string(
    label: 'Description',
    initialValue:
        'This action will permanently delete the selected item. Are you sure?',
  );
  final isDismissible = context.knobs.boolean(
    label: 'Dismissible',
    initialValue: true,
  );
  final primaryButtonText = context.knobs.string(
    label: 'Primary Button Text',
    initialValue: 'Delete',
  );

  return Center(
    child: DsButton.destructive(
      'Show Delete Sheet',
      onTap: () {
        DsModalBottomSheet.show(
          context: context,
          title: DsBottomSheetTitle.text(title),
          description: DsBottomSheetDescription.text(description),
          isDismissible: isDismissible,
          primaryButtonText: primaryButtonText,
          onPrimaryButtonPressed: () {
            Navigator.of(context).pop();
            debugPrint('Delete confirmed');
          },
        );
      },
    ),
  );
}

@UseCase(
  name: 'Bottom Sheet - Non-Dismissible',
  type: DsButton,
  path: '[Molecules]/Bottom Sheets',
)
Widget modalBottomSheetNonDismissibleUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Required Action',
  );
  final description = context.knobs.string(
    label: 'Description',
    initialValue: 'You must complete this action before continuing.',
  );
  final primaryButtonText = context.knobs.string(
    label: 'Primary Button Text',
    initialValue: 'Complete',
  );

  return Center(
    child: DsButton.primary(
      'Show Required Sheet',
      onTap: () {
        DsModalBottomSheet.show(
          context: context,
          title: DsBottomSheetTitle.text(title),
          description: DsBottomSheetDescription.text(description),
          isDismissible: false,
          primaryButtonText: primaryButtonText,
          onPrimaryButtonPressed: () {
            Navigator.of(context).pop();
            debugPrint('Required action completed');
          },
        );
      },
    ),
  );
}
