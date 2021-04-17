import 'package:ezorrio_dev/model/Project.dart';

class Work {
  String company;
  String position;
  String? link;
  DateTime? start;
  DateTime? end;
  List<Project> projects;

  Work({
    required this.company,
    required this.projects,
    required this.position,
    this.link,
    this.start,
    this.end,
  });
}
