part of 'NavigationBloc.dart';

class NavigationState {
  AppPlace currentPage;

  NavigationState({required this.currentPage});

  List<Object> get props => [currentPage.routeName];
}
