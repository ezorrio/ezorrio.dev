import 'dart:async';

import 'package:ezorrio_dev/model/app_place.dart';
import 'package:ezorrio_dev/places.dart';
import 'package:ezorrio_dev/ui/page/projects_page.dart';
import 'package:ezorrio_dev/ui/page/work_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(currentPage: Places.work)) {
    on<AppPageOpened>(onAppPageOpened);
  }

  FutureOr<void> onAppPageOpened(AppPageOpened event, Emitter<NavigationState> emit) {
    AppPlace currentPage;
    switch (event.routeName) {
      case ProjectsPage.routeName:
        currentPage = Places.projects;
        break;
      case WorkPage.routeName:
      default:
        currentPage = Places.work;
        break;
    }
    emit(NavigationState(currentPage: currentPage));
  }
}
