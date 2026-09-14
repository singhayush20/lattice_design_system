import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';



@UseCase(name: 'App Bar', type: DsAppBar, path: '[Molecules]/App Bars')
Widget appBarUseCase(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Settings');
  final subtitle = context.knobs.stringOrNull(
    label: 'Subtitle',
    initialValue: 'Manage your preferences',
  );
  final centerTitle = context.knobs.boolean(
    label: 'Center Title',
    initialValue: false,
  );
  final showBottomBorder = context.knobs.boolean(
    label: 'Show Bottom Border',
    initialValue: true,
  );
  final automaticallyImplyLeading = context.knobs.boolean(
    label: 'Auto Back Button',
    initialValue: true,
  );
  final backButtonRequired = context.knobs.boolean(
    label: 'Back Button Required',
    initialValue: true,
  );
  final showActions = context.knobs.boolean(
    label: 'Show Actions',
    initialValue: true,
  );

  return MaterialApp(
    theme: DsTheme.light(),
    darkTheme: DsTheme.dark(),
    themeMode: ThemeMode.system,
    home: Scaffold(
      appBar: DsAppBar(
        title: title,
        subtitle: subtitle,
        centerTitle: centerTitle,
        showBottomBorder: showBottomBorder,
        automaticallyImplyLeading: automaticallyImplyLeading,
        backButtonRequired: backButtonRequired,
        actions: showActions
            ? [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => debugPrint('Search tapped'),
                  tooltip: 'Search',
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () => debugPrint('Menu tapped'),
                  tooltip: 'More options',
                ),
              ]
            : null,
        onBackPressed: () => debugPrint('Back pressed'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'App Bar Content',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              'Configure the app bar using knobs',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'App Bar - With Sliver',
  type: DsSliverAppBar,
  path: '[Molecules]/App Bars',
)
Widget sliverAppBarUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Sliver App Bar',
  );
  final centerTitle = context.knobs.boolean(
    label: 'Center Title',
    initialValue: false,
  );
  final floating = context.knobs.boolean(label: 'Floating', initialValue: true);
  final pinned = context.knobs.boolean(label: 'Pinned', initialValue: true);
  final snap = context.knobs.boolean(label: 'Snap', initialValue: false);

  return MaterialApp(
    theme: DsTheme.light(),
    darkTheme: DsTheme.dark(),
    themeMode: ThemeMode.system,
    home: Scaffold(
      body: CustomScrollView(
        slivers: [
          DsSliverAppBar(
            title: title,
            centerTitle: centerTitle,
            floating: floating,
            pinned: pinned,
            snap: snap,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => debugPrint('Search tapped'),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item $index'),
                onTap: () => debugPrint('Item $index tapped'),
              ),
              childCount: 30,
            ),
          ),
        ],
      ),
    ),
  );
}
