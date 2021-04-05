part of 'AppearanceBloc.dart';

abstract class AppearanceEvent {
  const AppearanceEvent();
}

class InitSettings extends AppearanceEvent {}

class LightManualChose extends AppearanceEvent {}

class DarkManualChose extends AppearanceEvent {}

class SystemChose extends AppearanceEvent {}

class PlatformThemeChanged extends AppearanceEvent {}