import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';



@UseCase(name: 'Snack Bar', type: DsButton, path: '[Molecules]/Snack Bars')
Widget snackBarUseCase(BuildContext context) {
  final message = context.knobs.string(
    label: 'Message',
    initialValue: 'Changes saved successfully',
  );
  final trailingActionLabel = context.knobs.stringOrNull(
    label: 'Action Label',
    initialValue: 'Undo',
  );
  final showTrailingAction = trailingActionLabel != null;
  final duration = context.knobs.double.slider(
    label: 'Duration (seconds)',
    initialValue: 4,
    min: 1,
    max: 10,
    divisions: 9,
  );

  return MaterialApp(
    theme: DsTheme.light(),
    darkTheme: DsTheme.dark(),
    themeMode: ThemeMode.system,
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Snack Bar Demo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            DsButton.primary(
              'Show Snack Bar',
              onTap: () {
                DsSnackBar.show(
                  context,
                  message: message,
                  trailingActionIcon: showTrailingAction ? Icons.undo : null,
                  trailingActionLabel: trailingActionLabel,
                  onTrailingActionPressed: showTrailingAction
                      ? () => debugPrint('Undo tapped')
                      : null,
                  duration: Duration(seconds: duration.round()),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Snack Bar - Error',
  type: DsButton,
  path: '[Molecules]/Snack Bars',
)
Widget snackBarErrorUseCase(BuildContext context) {
  final message = context.knobs.string(
    label: 'Error Message',
    initialValue: 'Failed to save changes. Please try again.',
  );
  final duration = context.knobs.double.slider(
    label: 'Duration (seconds)',
    initialValue: 4,
    min: 1,
    max: 10,
    divisions: 9,
  );

  return MaterialApp(
    theme: DsTheme.light(),
    darkTheme: DsTheme.dark(),
    themeMode: ThemeMode.system,
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error Snack Bar',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            DsButton.destructive(
              'Show Error Snack Bar',
              onTap: () {
                DsSnackBar.show(
                  context,
                  message: message,
                  backgroundColor: context.dsColors.backgroundError,
                  textColor: context.dsColors.textError,
                  duration: Duration(seconds: duration.round()),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Snack Bar - With Custom Action',
  type: DsButton,
  path: '[Molecules]/Snack Bars',
)
Widget snackBarCustomActionUseCase(BuildContext context) {
  final message = context.knobs.string(
    label: 'Message',
    initialValue: 'New version available',
  );
  final actionLabel = context.knobs.string(
    label: 'Action Label',
    initialValue: 'Update',
  );
  final duration = context.knobs.double.slider(
    label: 'Duration (seconds)',
    initialValue: 6,
    min: 2,
    max: 15,
    divisions: 13,
  );

  return MaterialApp(
    theme: DsTheme.light(),
    darkTheme: DsTheme.dark(),
    themeMode: ThemeMode.system,
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Snack Bar with Action',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            DsButton.primary(
              'Show Update Snack Bar',
              onTap: () {
                DsSnackBar.show(
                  context,
                  message: message,
                  trailingActionIcon: Icons.system_update,
                  trailingActionLabel: actionLabel,
                  onTrailingActionPressed: () =>
                      debugPrint('Update action triggered'),
                  duration: Duration(seconds: duration.round()),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
