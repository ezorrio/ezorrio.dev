enum AppTheme {
  light,
  dark,
  system;

  factory AppTheme.fromValue(int? index) => switch (index) {
        0 => AppTheme.light,
        1 => AppTheme.dark,
        _ => AppTheme.system,
      };
}

class AppearanceState {
  final AppTheme appTheme;

  const AppearanceState(this.appTheme);
}
