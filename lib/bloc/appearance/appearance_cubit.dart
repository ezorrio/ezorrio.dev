import 'package:ezorrio_dev/resource/settings_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'appearance_state.dart';

class AppearanceCubit extends Cubit<AppearanceState> {
  SettingsRepository repository;

  AppearanceCubit({required this.repository}) : super(const AppearanceState(AppTheme.system)) {
    initSettings();
  }

  void platformThemeChanged() => emit(state);

  Future<void> systemChose() async {
    await repository.storeThemePreference(theme: AppTheme.system);
    emit(const AppearanceState(AppTheme.system));
  }

  Future<void> darkManualChose() async {
    await repository.storeThemePreference(theme: AppTheme.dark);
    emit(const AppearanceState(AppTheme.dark));
  }

  Future<void> lightManualChose() async {
    await repository.storeThemePreference(theme: AppTheme.light);
    emit(const AppearanceState(AppTheme.light));
  }

  Future<void> initSettings() async => emit(AppearanceState(await repository.getTheme()));
}
