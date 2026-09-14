import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';

@UseCase(
  name: 'Primary',
  type: DsButton,
  path: '[Atoms]/Buttons',
)
Widget primaryButtonUseCase(BuildContext context) {
  final data = context.knobs.string(
    label: 'Label',
    initialValue: 'Primary Button',
  );
  final isLoading = context.knobs.boolean(
    label: 'Loading',
    initialValue: false,
  );
  final isFullWidth = context.knobs.boolean(
    label: 'Full Width',
    initialValue: false,
  );
  final size = context.knobs.object.dropdown<DsButtonSize>(
    label: 'Size',
    options: DsButtonSize.values,
    initialOption: DsButtonSize.medium,
    labelBuilder: (v) => v.name,
  );
  final leadingIcon = context.knobs.boolean(
    label: 'Show Leading Icon',
    initialValue: false,
  );

  return Center(
    child: ConstrainedBox(
      constraints: isFullWidth ? const BoxConstraints(maxWidth: double.infinity) : const BoxConstraints(),
      child: DsButton.primary(
        data,
        size: size,
        isLoading: isLoading,
        isFullWidth: isFullWidth,
        leading: leadingIcon
            ? DsButtonIcon.icon(Icons.arrow_forward)
            : null,
        onTap: () => debugPrint('Primary button tapped'),
      ),
    ),
  );
}

@UseCase(
  name: 'Secondary',
  type: DsButton,
  path: '[Atoms]/Buttons',
)
Widget secondaryButtonUseCase(BuildContext context) {
  final data = context.knobs.string(
    label: 'Label',
    initialValue: 'Secondary Button',
  );
  final isLoading = context.knobs.boolean(
    label: 'Loading',
    initialValue: false,
  );
  final isFullWidth = context.knobs.boolean(
    label: 'Full Width',
    initialValue: false,
  );
  final size = context.knobs.object.dropdown<DsButtonSize>(
    label: 'Size',
    options: DsButtonSize.values,
    initialOption: DsButtonSize.medium,
    labelBuilder: (v) => v.name,
  );
  final leadingIcon = context.knobs.boolean(
    label: 'Show Leading Icon',
    initialValue: false,
  );

  return Center(
    child: ConstrainedBox(
      constraints: isFullWidth ? const BoxConstraints(maxWidth: double.infinity) : const BoxConstraints(),
      child: DsButton.secondary(
        data,
        size: size,
        isLoading: isLoading,
        isFullWidth: isFullWidth,
        leading: leadingIcon
            ? DsButtonIcon.icon(Icons.arrow_forward)
            : null,
        onTap: () => debugPrint('Secondary button tapped'),
      ),
    ),
  );
}

@UseCase(
  name: 'Tertiary',
  type: DsButton,
  path: '[Atoms]/Buttons',
)
Widget tertiaryButtonUseCase(BuildContext context) {
  final data = context.knobs.string(
    label: 'Label',
    initialValue: 'Tertiary Button',
  );
  final isLoading = context.knobs.boolean(
    label: 'Loading',
    initialValue: false,
  );
  final isFullWidth = context.knobs.boolean(
    label: 'Full Width',
    initialValue: false,
  );
  final size = context.knobs.object.dropdown<DsButtonSize>(
    label: 'Size',
    options: DsButtonSize.values,
    initialOption: DsButtonSize.medium,
    labelBuilder: (v) => v.name,
  );
  final leadingIcon = context.knobs.boolean(
    label: 'Show Leading Icon',
    initialValue: false,
  );

  return Center(
    child: ConstrainedBox(
      constraints: isFullWidth ? const BoxConstraints(maxWidth: double.infinity) : const BoxConstraints(),
      child: DsButton.tertiary(
        data,
        size: size,
        isLoading: isLoading,
        isFullWidth: isFullWidth,
        leading: leadingIcon
            ? DsButtonIcon.icon(Icons.arrow_forward)
            : null,
        onTap: () => debugPrint('Tertiary button tapped'),
      ),
    ),
  );
}

@UseCase(
  name: 'Destructive',
  type: DsButton,
  path: '[Atoms]/Buttons',
)
Widget destructiveButtonUseCase(BuildContext context) {
  final data = context.knobs.string(
    label: 'Label',
    initialValue: 'Delete',
  );
  final isLoading = context.knobs.boolean(
    label: 'Loading',
    initialValue: false,
  );
  final isFullWidth = context.knobs.boolean(
    label: 'Full Width',
    initialValue: false,
  );
  final size = context.knobs.object.dropdown<DsButtonSize>(
    label: 'Size',
    options: DsButtonSize.values,
    initialOption: DsButtonSize.medium,
    labelBuilder: (v) => v.name,
  );
  final leadingIcon = context.knobs.boolean(
    label: 'Show Leading Icon',
    initialValue: false,
  );

  return Center(
    child: ConstrainedBox(
      constraints: isFullWidth ? const BoxConstraints(maxWidth: double.infinity) : const BoxConstraints(),
      child: DsButton.destructive(
        data,
        size: size,
        isLoading: isLoading,
        isFullWidth: isFullWidth,
        leading: leadingIcon
            ? DsButtonIcon.icon(Icons.delete)
            : null,
        onTap: () => debugPrint('Destructive button tapped'),
      ),
    ),
  );
}

@UseCase(
  name: 'All Variants',
  type: DsButton,
  path: '[Atoms]/Buttons',
)
Widget allVariantsUseCase(BuildContext context) {
  final isLoading = context.knobs.boolean(
    label: 'Loading (all)',
    initialValue: false,
  );
  final isFullWidth = context.knobs.boolean(
    label: 'Full Width (all)',
    initialValue: false,
  );
  final size = context.knobs.object.dropdown<DsButtonSize>(
    label: 'Size (all)',
    options: DsButtonSize.values,
    initialOption: DsButtonSize.medium,
    labelBuilder: (v) => v.name,
  );

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: isFullWidth ? const BoxConstraints(maxWidth: double.infinity) : const BoxConstraints(),
          child: DsButton.primary(
            'Primary',
            size: size,
            isLoading: isLoading,
            isFullWidth: isFullWidth,
            onTap: () => debugPrint('Primary tapped'),
          ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: isFullWidth ? const BoxConstraints(maxWidth: double.infinity) : const BoxConstraints(),
          child: DsButton.secondary(
            'Secondary',
            size: size,
            isLoading: isLoading,
            isFullWidth: isFullWidth,
            onTap: () => debugPrint('Secondary tapped'),
          ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: isFullWidth ? const BoxConstraints(maxWidth: double.infinity) : const BoxConstraints(),
          child: DsButton.tertiary(
            'Tertiary',
            size: size,
            isLoading: isLoading,
            isFullWidth: isFullWidth,
            onTap: () => debugPrint('Tertiary tapped'),
          ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: isFullWidth ? const BoxConstraints(maxWidth: double.infinity) : const BoxConstraints(),
          child: DsButton.destructive(
            'Destructive',
            size: size,
            isLoading: isLoading,
            isFullWidth: isFullWidth,
            onTap: () => debugPrint('Destructive tapped'),
          ),
        ),
      ],
    ),
  );
}