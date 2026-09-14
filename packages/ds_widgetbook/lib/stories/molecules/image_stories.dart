import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';



@UseCase(name: 'Network Image', type: DsImage, path: '[Molecules]/Images')
Widget networkImageUseCase(BuildContext context) {
  final mediaUrl = context.knobs.string(
    label: 'Image URL',
    initialValue: 'https://picsum.photos/400/300',
  );
  final width = context.knobs.double.slider(
    label: 'Width',
    initialValue: 300,
    min: 100,
    max: 500,
    divisions: 40,
  );
  final height = context.knobs.double.slider(
    label: 'Height',
    initialValue: 200,
    min: 100,
    max: 500,
    divisions: 40,
  );
  final fit = context.knobs.object.dropdown<BoxFit>(
    label: 'Fit',
    options: BoxFit.values,
    initialOption: BoxFit.cover,
    labelBuilder: (v) => v.name,
  );

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Network Image', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        DsImage(mediaUrl: mediaUrl, width: width, height: height, fit: fit),
        const SizedBox(height: 16),
        Text(
          'URL: $mediaUrl',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

@UseCase(name: 'SVG Network Image', type: DsImage, path: '[Molecules]/Images')
Widget svgNetworkImageUseCase(BuildContext context) {
  final mediaUrl = context.knobs.string(
    label: 'SVG URL',
    initialValue:
        'https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/icons/heart.svg',
  );
  final width = context.knobs.double.slider(
    label: 'Width',
    initialValue: 100,
    min: 50,
    max: 300,
    divisions: 25,
  );
  final height = context.knobs.double.slider(
    label: 'Height',
    initialValue: 100,
    min: 50,
    max: 300,
    divisions: 25,
  );
  final fit = context.knobs.object.dropdown<BoxFit>(
    label: 'Fit',
    options: BoxFit.values,
    initialOption: BoxFit.contain,
    labelBuilder: (v) => v.name,
  );

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'SVG Network Image',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        DsImage(mediaUrl: mediaUrl, width: width, height: height, fit: fit),
        const SizedBox(height: 16),
        Text(
          'URL: $mediaUrl',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

@UseCase(
  name: 'Asset Image Placeholder',
  type: DsImage,
  path: '[Molecules]/Images',
)
Widget assetImagePlaceholderUseCase(BuildContext context) {
  final width = context.knobs.double.slider(
    label: 'Width',
    initialValue: 200,
    min: 100,
    max: 500,
    divisions: 40,
  );
  final height = context.knobs.double.slider(
    label: 'Height',
    initialValue: 150,
    min: 100,
    max: 500,
    divisions: 40,
  );
  final fit = context.knobs.object.dropdown<BoxFit>(
    label: 'Fit',
    options: BoxFit.values,
    initialOption: BoxFit.cover,
    labelBuilder: (v) => v.name,
  );

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Asset Image (placeholder)',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        DsImage(
          mediaUrl: 'assets/images/placeholder.png',
          width: width,
          height: height,
          fit: fit,
        ),
        const SizedBox(height: 16),
        Text(
          'Note: Add assets/images/placeholder.png to ds_widgetbook/pubspec.yaml to test',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
