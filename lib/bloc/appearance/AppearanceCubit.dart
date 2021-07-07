import 'package:bloc/bloc.dart';
import 'package:ezorrio_dev/resource/SettingsRepository.dart';

import 'AppearanceState.dart';

class AppearanceCubit extends Cubit<AppearanceState> {
  SettingsRepository repository;

  AppearanceCubit({required this.repository}) : super(System()) {
    initSettings();
  }

  void platformThemeChanged() {
    emit(state);
  }

  void systemChose() async {
    await repository.storeThemePreference(theme: AppTheme.SYSTEM);
    emit(System());
  }

  void darkManualChose() async {
    await repository.storeThemePreference(theme: AppTheme.DARK);
    emit(Dark());
  }

  void lightManualChose() async {
    await repository.storeThemePreference(theme: AppTheme.LIGHT);
    emit(Light());
  }

  void initSettings() async {
    final theme = await repository.getTheme();
    switch (theme) {
      case AppTheme.LIGHT:
        emit(Light());
        break;
      case AppTheme.DARK:
        emit(Dark());
        break;
      case AppTheme.SYSTEM:
        emit(System());
        break;
    }
  }
}
