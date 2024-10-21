import 'package:flutter/material.dart';
import 'package:screl/config/colors.dart' as colors;

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.labelText,
    this.hintText,
    this.helperText,
    this.enabled,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.controller,
    super.key,
  });

  final String labelText;
  final String? hintText;
  final String? helperText;
  final bool? enabled;
  final int? maxLength;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: colors.inputLabel,
              ),
        ),
        const SizedBox(height: 4),
        _AppTextFormField(
          hintText: hintText,
          enabled: enabled,
          key: key,
          validator: validator,
          maxLength: maxLength,
          maxLines: maxLines,
          controller: controller,
        ),
        if (helperText != null) ...[
          const SizedBox(height: 6),
          Text(
            helperText!,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: colors.inputBorder,
                ),
          ),
        ],
      ],
    );
  }
}

class _AppTextFormField extends TextFormField {
  _AppTextFormField({
    String? hintText,
    super.validator,
    super.key,
    super.maxLength,
    super.maxLines,
    super.enabled,
    super.controller,
  }) : super(
          cursorColor: colors.primary,
          decoration: InputDecoration(
            hintText: hintText,
            counterText: '',
          ),
        );
}
