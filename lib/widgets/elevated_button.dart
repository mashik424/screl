import 'package:flutter/material.dart';

class AppTextButton extends TextButton {
  AppTextButton({
    super.key,
    super.onPressed,
    Widget? child,
    String label = '',
  }) : super(child: child ?? Text(label));
}
