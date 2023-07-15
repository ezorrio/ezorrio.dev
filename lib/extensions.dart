import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  TextStyle get textStyleTitle => Theme.of(this).textTheme.titleLarge!;

  TextStyle get textStyleBody1 => Theme.of(this).textTheme.bodyLarge!;

  TextStyle get textStyleBody2 => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get textStyleCaption => Theme.of(this).textTheme.bodySmall!;

  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get cardBackground => Theme.of(this).cardColor;

  Color get primaryColor => Theme.of(this).colorScheme.primary;

  Color get dividerColor => Theme.of(this).dividerColor;
}
