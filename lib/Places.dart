import 'package:ezorrio_dev/ui/page/EducationPage.dart';
import 'package:ezorrio_dev/ui/page/IntroPage.dart';
import 'package:ezorrio_dev/ui/page/ProjectsPage.dart';
import 'package:ezorrio_dev/ui/page/WorkPage.dart';
import 'package:flutter/material.dart';

import 'model/AppPlace.dart';

class Places {
  static var intro = AppPlace(
      title: 'Introduction',
      icon: Icons.info_outline,
      routeName: IntroPage.routeName);
  static var education = AppPlace(
      title: 'Education',
      icon: Icons.book_outlined,
      routeName: EducationPage.routeName);
  static var work = AppPlace(
      title: 'Career', icon: Icons.work_outline, routeName: WorkPage.routeName);
  static var projects = AppPlace(
      title: 'Projects', icon: Icons.code, routeName: ProjectsPage.routeName);
}
