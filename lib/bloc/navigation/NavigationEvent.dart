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
