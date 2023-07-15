import 'package:ezorrio_dev/ui/page/education_page.dart';
import 'package:ezorrio_dev/ui/page/intro_page.dart';
import 'package:ezorrio_dev/ui/page/projects_page.dart';
import 'package:ezorrio_dev/ui/page/work_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static PageRoute<dynamic> onGenerateRoute({required BuildContext context, required RouteSettings settings}) {
    Widget routeContent = switch (settings.name) {
      EducationPage.routeName => EducationPage.instance(),
      ProjectsPage.routeName => ProjectsPage.instance(),
      WorkPage.routeName => WorkPage.instance(),
      IntroPage.routeName || _ => IntroPage.instance(),
    };
    return MaterialPageRoute<dynamic>(
      builder: (_) => routeContent,
      settings: settings,
    );
  }
}
