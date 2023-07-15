part of 'navigation_bloc.dart';

class NavigationState {
  AppPlace currentPage;

  NavigationState({required this.currentPage});

  List<Object> get props => [currentPage.routeName];
}
