import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ezorrio_dev/resource/SettingsRepository.dart';

part 'AppearanceEvent.dart';
part 'AppearanceState.dart';

class AppearanceBloc extends Bloc<AppearanceEvent, AppearanceState> {
  SettingsRepository repository;

  AppearanceBloc({required this.repository})
      : super(AppearanceState(theme: AppTheme.SYSTEM)) {
    add(InitSettings());
  }

  AppTheme theme = AppTheme.SYSTEM;

  @override
  Stream<AppearanceState> mapEventToState(
      AppearanceEvent event,
      ) async* {
    if (event is InitSettings) {
      theme = await repository.getTheme();
    }

    if (event is LightManualChose) {
      await repository.storeThemePreference(theme: AppTheme.LIGHT);
      theme = AppTheme.LIGHT;
    }

    if (event is DarkManualChose) {
      await repository.storeThemePreference(theme: AppTheme.DARK);
      theme = AppTheme.DARK;
    }

    if (event is SystemChose) {
      await repository.storeThemePreference(theme: AppTheme.SYSTEM);
      theme = AppTheme.SYSTEM;
    }

    yield AppearanceState(theme: theme);
  }
}