part of 'AppearanceBloc.dart';

class AppearanceState {
  AppTheme theme;

  AppearanceState({required this.theme});

  List<Object> get props => [theme];
}

enum AppTheme { LIGHT, DARK, SYSTEM }

extension AppThemeExt on AppTheme {
  static AppTheme fromValue(int? index) {
    switch (index) {
      case 0:
        return AppTheme.LIGHT;
      case 1:
        return AppTheme.DARK;
      case 2:
        return AppTheme.SYSTEM;
      default:
        return AppTheme.SYSTEM;
    }
  }
}