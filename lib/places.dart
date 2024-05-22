import 'package:ezorrio_dev/model/app_place.dart';
import 'package:ezorrio_dev/ui/page/projects_page.dart';
import 'package:ezorrio_dev/ui/page/work_page.dart';
import 'package:flutter/material.dart';

class Places {
  static var work = AppPlace(title: 'Career', icon: Icons.work_outline, routeName: WorkPage.routeName);
  static var projects = AppPlace(title: 'Projects', icon: Icons.code, routeName: ProjectsPage.routeName);
}
