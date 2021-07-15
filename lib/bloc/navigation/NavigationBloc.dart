import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ezorrio_dev/Places.dart';
import 'package:ezorrio_dev/main.dart';
import 'package:ezorrio_dev/model/AppPlace.dart';
import 'package:ezorrio_dev/ui/page/EducationPage.dart';
import 'package:ezorrio_dev/ui/page/IntroPage.dart';
import 'package:ezorrio_dev/ui/page/ProjectsPage.dart';
import 'package:ezorrio_dev/ui/page/WorkPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'NavigationEvent.dart';
part 'NavigationState.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  late bool isFullscreen;
  late AppPlace currentPage;
  late StreamSubscription navigationSubscription;

  NavigationBloc() : super(NavigationState(currentPage: Places.intro));

  @override
  Future<void> close() async {
    await navigationSubscription.cancel();
    return super.close();
  }

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is AppPageOpened) {
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
    }

    if (event is AppPopupOpened) {
      if (event.isPreviousPopup) {
        Navigator.removeRoute(
            App.navigatorKey.currentContext!, event.previousRoute!);
      }
    }

    yield (NavigationState(currentPage: currentPage));
  }
}
