import 'package:flutter/material.dart';
import 'package:screl/config/colors.dart' as colors;

ThemeData get lightTheme => ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: colors.primary),
      useMaterial3: true,
      textTheme: textTheme,
      scaffoldBackgroundColor: const Color(0xFFF1F2F6),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(
            EdgeInsets.all(20),
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return colors.primaryDisabled;
              } else if (states.contains(WidgetState.hovered)) {
                return colors.primaryHovered;
              } else if (states.contains(WidgetState.pressed)) {
                return colors.primaryPressed;
              }
              return colors.primary;
            },
          ),
          foregroundColor: const WidgetStatePropertyAll(
            colors.onPrimary,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(
            EdgeInsets.all(20),
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.hovered)) {
                return colors.secondaryHovered;
              } else if (states.contains(WidgetState.pressed)) {
                return colors.secondaryPressed;
              }
              return null;
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return colors.primaryDisabled;
              }
              return colors.onSecondary;
            },
          ),
          side: WidgetStateBorderSide.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return const BorderSide(color: colors.secondaryPressed);
              }
              return const BorderSide(color: colors.primary);
            },
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: const BorderSide(color: colors.primary),
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          fontSize: 13,
          height: 1.33,
          fontWeight: FontWeight.w500,
          color: colors.inputHint,
        ),
        helperStyle: const TextStyle(
          fontSize: 13,
          height: 1.33,
          color: colors.inputBorder,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: colors.inputBorder,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: colors.inputBorderDisabled,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: colors.primary,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: colors.inputBorder,
        
      ),
    );

TextTheme get textTheme => const TextTheme();
