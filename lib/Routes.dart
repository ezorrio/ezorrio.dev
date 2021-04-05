import 'package:ezorrio_dev/ui/page/EducationPage.dart';
import 'package:ezorrio_dev/ui/page/IntroPage.dart';
import 'package:ezorrio_dev/ui/page/ProjectsPage.dart';
import 'package:ezorrio_dev/ui/page/WorkPage.dart';
import 'package:flutter/material.dart';

class Routes {
  static PageRoute onGenerateRoute(
      {required BuildContext context, required RouteSettings settings}) {
    var routeContent;
    var fullscreenDialog = false;
    switch (settings.name) {
      case EducationPage.routeName:
        routeContent = EducationPage.instance();
        break;
      case ProjectsPage.routeName:
        routeContent = ProjectsPage.instance();
        break;
      case WorkPage.routeName:
        routeContent = WorkPage.instance();
        break;
      case IntroPage.routeName:
      default:
        routeContent = IntroPage.instance();
        break;
    }
    return MaterialPageRoute(
        builder: (_) => routeContent,
        settings: settings,
        fullscreenDialog: fullscreenDialog);
  }
}
