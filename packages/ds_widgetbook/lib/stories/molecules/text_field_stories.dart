import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';



@UseCase(name: 'Text Field', type: DsTextField, path: '[Molecules]/Text Field')
Widget textFieldUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Email Address',
  );
  final hint = context.knobs.string(
    label: 'Hint',
    initialValue: 'Enter your email',
  );
  final errorText = context.knobs.stringOrNull(
    label: 'Error Text',
    initialValue: null,
  );
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final obscureText = context.knobs.boolean(
    label: 'Obscure Text',
    initialValue: false,
  );
  final showLeadingIcon = context.knobs.boolean(
    label: 'Show Leading Icon',
    initialValue: false,
  );
  final showTrailingIcon = context.knobs.boolean(
    label: 'Show Trailing Icon',
    initialValue: false,
  );
  final maxLines = context.knobs.int.slider(
    label: 'Max Lines',
    initialValue: 1,
    min: 1,
    max: 5,
  );

  return _TextFieldWrapper(
    label: label,
    hint: hint,
    errorText: errorText,
    enabled: enabled,
    obscureText: obscureText,
    leadingIcon: showLeadingIcon ? Icons.email : null,
    trailingIcon: showTrailingIcon ? Icons.clear : null,
    maxLines: maxLines,
  );
}

class _TextFieldWrapper extends StatefulWidget {
  const _TextFieldWrapper({
    required this.label,
    required this.hint,
    required this.errorText,
    required this.enabled,
    required this.obscureText,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.maxLines,
  });

  final String label;
  final String hint;
  final String? errorText;
  final bool enabled;
  final bool obscureText;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final int maxLines;

  @override
  State<_TextFieldWrapper> createState() => _TextFieldWrapperState();
}

class _TextFieldWrapperState extends State<_TextFieldWrapper> {
  late final TextEditingController _controller;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _errorText = widget.errorText;
  }

  @override
  void didUpdateWidget(_TextFieldWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.errorText != oldWidget.errorText) {
      setState(() => _errorText = widget.errorText);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Text Field', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            DsTextField(
              controller: _controller,
              label: widget.label,
              hint: widget.hint,
              errorText: _errorText,
              enabled: widget.enabled,
              obscureText: widget.obscureText,
              leadingIcon: widget.leadingIcon,
              trailingIcon: widget.trailingIcon,
              maxLines: widget.maxLines,
              onChanged: (v) => debugPrint('Text changed: $v'),
              onSubmitted: (v) => debugPrint('Text submitted: $v'),
              onTrailingIconTap: () {
                _controller.clear();
                debugPrint('Trailing icon tapped');
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Value: ${_controller.text}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
