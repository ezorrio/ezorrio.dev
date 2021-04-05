part of 'NavigationBloc.dart';

abstract class NavigationEvent {
  const NavigationEvent();

  List<Object> get props => [];
}

class AppPageOpened extends NavigationEvent {
  final String routeName;

  const AppPageOpened({required this.routeName});

  @override
  List<Object> get props => [routeName];
}

class AppPopupOpened extends NavigationEvent {
  final bool isPreviousPopup;
  final Route<dynamic>? previousRoute;

  const AppPopupOpened(
      {required this.isPreviousPopup, required this.previousRoute});

  @override
  List<Object> get props => [isPreviousPopup];
}

class AppPopupClosed extends NavigationEvent {}