import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ds_core/ds_core.dart';

part 'ds_text_field_style.dart';

final class DsTextField extends StatefulWidget {
  const DsTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.errorText,
    this.leadingIcon,
    this.trailingIcon,
    this.onTrailingIconTap,
    this.onChanged,
    this.onSubmitted,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction,
    this.autocorrect = true,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final String? errorText;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTrailingIconTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autocorrect;
  final bool autofocus;

  @override
  State<DsTextField> createState() => _DsTextFieldState();
}

class _DsTextFieldState extends State<DsTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _isFocused = false;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
    _obscureText = widget.obscureText;
  }

  @override
  void didUpdateWidget(DsTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.obscureText != oldWidget.obscureText) {
      _obscureText = widget.obscureText;
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.controller == null) _controller.dispose();
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  void _toggleObscureText() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final typeScale = context.dsType;
    final hasError = widget.errorText != null;

    final borderColor = hasError
        ? colors.borderError
        : _isFocused
        ? colors.borderPrimary
        : colors.borderDefault;

    final fillColor = widget.enabled
        ? colors.backgroundSurface
        : colors.backgroundDisabled;

    final textColor = widget.enabled ? colors.textPrimary : colors.textDisabled;

    final iconColor = widget.enabled ? colors.iconPrimary : colors.iconDisabled;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          DsText.labelMedium(
            widget.label!,
            color: widget.enabled ? colors.textPrimary : colors.textDisabled,
          ),
          SizedBox(height: DsSpacing.verticalSpace8),
        ],
        AnimatedContainer(
          duration: DsDurations.fast,
          curve: DsCurves.standard,
          decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(
              color: borderColor,
              width: _isFocused ? DsSize.size2 : DsSize.size1,
            ),
            borderRadius: DsRadius.circular8,
          ),
          child: Row(
            children: [
              if (widget.leadingIcon != null) ...[
                Padding(
                  padding: EdgeInsets.only(left: DsSpacing.horizontalSpace16),
                  child: Icon(
                    widget.leadingIcon,
                    color: iconColor,
                    size: DsSize.size20,
                  ),
                ),
                SizedBox(width: DsSpacing.horizontalSpace12),
              ] else
                SizedBox(width: DsSpacing.horizontalSpace16),
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  obscureText: _obscureText,
                  enabled: widget.enabled,
                  readOnly: widget.readOnly,
                  maxLines: widget.maxLines,
                  maxLength: widget.maxLength,
                  inputFormatters: widget.inputFormatters,
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  autocorrect: widget.autocorrect,
                  autofocus: widget.autofocus,
                  onChanged: widget.onChanged,
                  onSubmitted: widget.onSubmitted,
                  style: typeScale.bodyLarge.copyWith(color: textColor),
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: typeScale.bodyLarge.copyWith(
                      color: colors.textTertiary,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: DsSpacing.verticalSpace14,
                    ),
                    counterText: '',
                  ),
                ),
              ),
              if (widget.trailingIcon != null || widget.obscureText) ...[
                if (widget.obscureText)
                  GestureDetector(
                    onTap: _toggleObscureText,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: DsSpacing.horizontalSpace16,
                      ),
                      child: Icon(
                        _obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: iconColor,
                        size: DsSize.size20,
                      ),
                    ),
                  )
                else
                  GestureDetector(
                    onTap: widget.onTrailingIconTap,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: DsSpacing.horizontalSpace16,
                      ),
                      child: Icon(
                        widget.trailingIcon,
                        color: iconColor,
                        size: DsSize.size20,
                      ),
                    ),
                  ),
              ] else
                SizedBox(width: DsSpacing.horizontalSpace16),
            ],
          ),
        ),
        if (widget.errorText != null) ...[
          SizedBox(height: DsSpacing.verticalSpace4),
          DsText.bodySmall(widget.errorText!, color: colors.textError),
        ],
      ],
    );
  }
}
