import 'package:flutter/material.dart';

class AppOutlinedButton extends OutlinedButton {
  AppOutlinedButton({
    super.key,
    super.onPressed,
    Widget? child,
    String label = '',
  }) : super(child: child ?? Text(label));
}
