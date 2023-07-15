import 'dart:async';

import 'package:ezorrio_dev/model/app_place.dart';
import 'package:ezorrio_dev/places.dart';
import 'package:ezorrio_dev/ui/page/education_page.dart';
import 'package:ezorrio_dev/ui/page/intro_page.dart';
import 'package:ezorrio_dev/ui/page/projects_page.dart';
import 'package:ezorrio_dev/ui/page/work_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(currentPage: Places.intro)) {
    on<AppPageOpened>(onAppPageOpened);
  }

  FutureOr<void> onAppPageOpened(AppPageOpened event, Emitter<NavigationState> emit) {
    AppPlace currentPage;
    switch (event.routeName) {
      case EducationPage.routeName:
        currentPage = Places.education;
        break;
      case WorkPage.routeName:
        currentPage = Places.work;
        break;
      case ProjectsPage.routeName:
        currentPage = Places.projects;
        break;
      case IntroPage.routeName:
      default:
        currentPage = Places.intro;
        break;
    }
    emit(NavigationState(currentPage: currentPage));
  }
}
