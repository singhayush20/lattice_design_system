import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';

@UseCase(
  name: 'Selectable',
  type: DsListTile,
  path: '[Atoms]/List Tiles',
)
Widget selectableListTileUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Settings',
  );
  final subtitle = context.knobs.string(
    label: 'Subtitle',
    initialValue: 'Manage your preferences',
  );
  final isSelected = context.knobs.boolean(
    label: 'Selected',
    initialValue: false,
  );
  final isEnabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );
  final showLeading = context.knobs.boolean(
    label: 'Show Leading Icon',
    initialValue: true,
  );
  final showTrailing = context.knobs.boolean(
    label: 'Show Trailing Icon',
    initialValue: false,
  );

  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DsListTile.selectable(
            title: DsListTileTitle.text(title),
            subtitle: DsListTileSubtitle.text(subtitle),
            isSelected: isSelected,
            isEnabled: isEnabled,
            leading: showLeading ? DsListTileLeading.icon(Icons.settings) : null,
            trailing: showTrailing ? DsListTileTrailing.icon(Icons.chevron_right) : null,
            onTap: () => debugPrint('Selectable tile tapped'),
          ),
          const SizedBox(height: 12),
          DsListTile.selectable(
            title: DsListTileTitle.text('$title 2'),
            subtitle: DsListTileSubtitle.text('$subtitle 2'),
            isSelected: !isSelected,
            isEnabled: isEnabled,
            leading: showLeading ? DsListTileLeading.icon(Icons.account_circle) : null,
            trailing: showTrailing ? DsListTileTrailing.icon(Icons.chevron_right) : null,
            onTap: () => debugPrint('Selectable tile 2 tapped'),
          ),
        ],
      ),
    ),
  );
}

@UseCase(
  name: 'Navigable',
  type: DsListTile,
  path: '[Atoms]/List Tiles',
)
Widget navigableListTileUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Profile',
  );
  final subtitle = context.knobs.string(
    label: 'Subtitle',
    initialValue: 'View and edit your profile',
  );
  final isEnabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );
  final showLeading = context.knobs.boolean(
    label: 'Show Leading Icon',
    initialValue: true,
  );
  final showTrailing = context.knobs.boolean(
    label: 'Show Trailing Icon',
    initialValue: true,
  );

  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DsListTile.navigable(
            title: DsListTileTitle.text(title),
            subtitle: DsListTileSubtitle.text(subtitle),
            isEnabled: isEnabled,
            leading: showLeading ? DsListTileLeading.icon(Icons.person) : null,
            trailing: showTrailing ? DsListTileTrailing.icon(Icons.chevron_right) : null,
            onTap: () => debugPrint('Navigable tile tapped'),
          ),
          const SizedBox(height: 12),
          DsListTile.navigable(
            title: DsListTileTitle.text('Notifications'),
            subtitle: DsListTileSubtitle.text('Manage notification preferences'),
            isEnabled: isEnabled,
            leading: showLeading ? DsListTileLeading.icon(Icons.notifications) : null,
            trailing: showTrailing ? DsListTileTrailing.icon(Icons.chevron_right) : null,
            onTap: () => debugPrint('Notifications tile tapped'),
          ),
        ],
      ),
    ),
  );
}

@UseCase(
  name: 'Default',
  type: DsListTile,
  path: '[Atoms]/List Tiles',
)
Widget defaultListTileUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Default Tile',
  );
  final subtitle = context.knobs.string(
    label: 'Subtitle',
    initialValue: 'A standard list tile',
  );
  final isEnabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );
  final showLeading = context.knobs.boolean(
    label: 'Show Leading Icon',
    initialValue: false,
  );
  final showTrailing = context.knobs.boolean(
    label: 'Show Trailing Icon',
    initialValue: false,
  );

  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: DsListTile(
        title: DsListTileTitle.text(title),
        subtitle: DsListTileSubtitle.text(subtitle),
        isEnabled: isEnabled,
        leading: showLeading ? DsListTileLeading.icon(Icons.info) : null,
        trailing: showTrailing ? DsListTileTrailing.icon(Icons.more_vert) : null,
        onTap: () => debugPrint('Default tile tapped'),
      ),
    ),
  );
}