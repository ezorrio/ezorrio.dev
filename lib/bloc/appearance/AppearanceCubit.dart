import 'package:ezorrio_dev/resource/SettingsRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'AppearanceState.dart';

class AppearanceCubit extends Cubit<AppearanceState> {
  SettingsRepository repository;

  AppearanceCubit({required this.repository}) : super(const System()) {
    initSettings();
  }

  void platformThemeChanged() {
    emit(state);
  }

  void systemChose() async {
    await repository.storeThemePreference(theme: AppTheme.system);
    emit(const System());
  }

  void darkManualChose() async {
    await repository.storeThemePreference(theme: AppTheme.dark);
    emit(const Dark());
  }

  void lightManualChose() async {
    await repository.storeThemePreference(theme: AppTheme.light);
    emit(const Light());
  }

  void initSettings() async {
    final theme = await repository.getTheme();
    switch (theme) {
      case AppTheme.light:
        emit(const Light());
        break;
      case AppTheme.dark:
        emit(const Dark());
        break;
      case AppTheme.system:
        emit(const System());
        break;
    }
  }
}
