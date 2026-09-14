import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';

@UseCase(
  name: 'Checkbox List Tile',
  type: DsCheckboxListTile,
  path: '[Atoms]/Inputs',
)
Widget checkboxListTileUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Accept terms',
  );
  final subtitle = context.knobs.string(
    label: 'Subtitle',
    initialValue: 'I agree to the terms and conditions',
  );
  final isEnabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );
  final isDense = context.knobs.boolean(
    label: 'Dense',
    initialValue: false,
  );
  final tristate = context.knobs.boolean(
    label: 'Tristate',
    initialValue: false,
  );
  final hasError = context.knobs.boolean(
    label: 'Has Error',
    initialValue: false,
  );

  return _CheckboxTileWrapper(
    initialValue: true,
    tristate: tristate,
    child: (value, onChanged) => DsCheckboxListTile(
      value: value,
      onChanged: onChanged,
      tristate: tristate,
      title: DsListTileTitleBody(title),
      subtitle: DsListTileSubtitleBody(subtitle),
      isEnabled: isEnabled,
      hasError: hasError,
    ),
    denseChild: (value, onChanged) => DsCheckboxListTile.dense(
      value: value,
      onChanged: onChanged,
      tristate: tristate,
      title: DsListTileTitleBody(title),
      subtitle: DsListTileSubtitleBody(subtitle),
      isEnabled: isEnabled,
      hasError: hasError,
    ),
    isDense: isDense,
  );
}

@UseCase(
  name: 'Radio List Tile',
  type: DsRadioListTile<String>,
  path: '[Atoms]/Inputs',
)
Widget radioListTileUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Option 1',
  );
  final subtitle = context.knobs.string(
    label: 'Subtitle',
    initialValue: 'Description for option 1',
  );
  final isEnabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );
  final isDense = context.knobs.boolean(
    label: 'Dense',
    initialValue: false,
  );

  return _RadioTileWrapper(
    options: const ['Option 1', 'Option 2', 'Option 3'],
    initialValue: 'Option 1',
    isDense: isDense,
    isEnabled: isEnabled,
    title: title,
    subtitle: subtitle,
  );
}

class _CheckboxTileWrapper extends StatefulWidget {
  const _CheckboxTileWrapper({
    required this.initialValue,
    required this.tristate,
    required this.child,
    required this.denseChild,
    required this.isDense,
  });

  final bool initialValue;
  final bool tristate;
  final Widget Function(bool?, ValueChanged<bool?>) child;
  final Widget Function(bool?, ValueChanged<bool?>) denseChild;
  final bool isDense;

  @override
  State<_CheckboxTileWrapper> createState() => _CheckboxTileWrapperState();
}

class _CheckboxTileWrapperState extends State<_CheckboxTileWrapper> {
  late bool? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: widget.isDense
            ? widget.denseChild(_value, (v) => setState(() => _value = v))
            : widget.child(_value, (v) => setState(() => _value = v)),
      ),
    );
  }
}

class _RadioTileWrapper extends StatefulWidget {
  const _RadioTileWrapper({
    required this.options,
    required this.initialValue,
    required this.isDense,
    required this.isEnabled,
    required this.title,
    required this.subtitle,
  });

  final List<String> options;
  final String initialValue;
  final bool isDense;
  final bool isEnabled;
  final String title;
  final String subtitle;

  @override
  State<_RadioTileWrapper> createState() => _RadioTileWrapperState();
}

class _RadioTileWrapperState extends State<_RadioTileWrapper> {
  late String _groupValue;

  @override
  void initState() {
    super.initState();
    _groupValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.options.map((option) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: widget.isDense
                   ? DsRadioListTile<String>.dense(
                       value: option,
                       groupValue: _groupValue,
                       onChanged: (v) => setState(() => _groupValue = v!),
                       title: DsListTileTitleBody('$option ${widget.title}'),
                       subtitle: DsListTileSubtitleBody(widget.subtitle),
                       isEnabled: widget.isEnabled,
                     )
                   : DsRadioListTile<String>(
                       value: option,
                       groupValue: _groupValue,
                       onChanged: (v) => setState(() => _groupValue = v!),
                       title: DsListTileTitleBody('$option ${widget.title}'),
                       subtitle: DsListTileSubtitleBody(widget.subtitle),
                       isEnabled: widget.isEnabled,
                     ),
            );
          }).toList(),
        ),
      ),
    );
  }
}