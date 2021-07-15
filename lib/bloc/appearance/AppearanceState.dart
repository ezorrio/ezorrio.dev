import 'package:freezed_annotation/freezed_annotation.dart';

part 'AppearanceState.freezed.dart';

@freezed
class AppearanceState with _$AppearanceState {
  const factory AppearanceState.light() = Light;

  const factory AppearanceState.dark() = Dark;

  const factory AppearanceState.system() = System;
}

enum AppTheme { light, dark, system }

extension AppThemeExt on AppTheme {
  static AppTheme fromValue(int? index) {
    switch (index) {
      case 0:
        return AppTheme.light;
      case 1:
        return AppTheme.dark;
      case 2:
        return AppTheme.system;
      default:
        return AppTheme.system;
    }
  }
}
