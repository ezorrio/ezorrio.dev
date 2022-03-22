import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  TextStyle get textStyleTitle => Theme.of(this).textTheme.headline6!;

  TextStyle get textStyleBody1 => Theme.of(this).textTheme.bodyText1!;

  TextStyle get textStyleBody2 => Theme.of(this).textTheme.bodyText2!;

  TextStyle get textStyleCaption => Theme.of(this).textTheme.caption!;

  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get cardBackground => Theme.of(this).cardColor;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get additionalColor => Theme.of(this).colorScheme.secondary;

  Color get dividerColor => Theme.of(this).dividerColor;
}
