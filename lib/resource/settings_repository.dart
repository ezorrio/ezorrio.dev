import 'package:ezorrio_dev/bloc/appearance/appearance_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  Future<bool> storeThemePreference({required AppTheme theme}) async =>
      (await preferences).setInt('theme', theme.index);

  Future<AppTheme> getTheme() async => AppTheme.fromValue((await preferences).getInt('theme'));
}
