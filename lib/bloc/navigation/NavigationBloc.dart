import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ezorrio_dev/Places.dart';
import 'package:ezorrio_dev/model/AppPlace.dart';
import 'package:ezorrio_dev/ui/page/EducationPage.dart';
import 'package:ezorrio_dev/ui/page/IntroPage.dart';
import 'package:ezorrio_dev/ui/page/ProjectsPage.dart';
import 'package:ezorrio_dev/ui/page/WorkPage.dart';

part 'NavigationEvent.dart';

part 'NavigationState.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(currentPage: Places.intro)) {
    on<AppPageOpened>(onAppPageOpened);
  }

  FutureOr<void> onAppPageOpened(
      AppPageOpened event, Emitter<NavigationState> emit) {
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
