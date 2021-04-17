class Project {
  String title;
  String description;
  DateTime? start;
  DateTime? end;
  String? link;

  Project({
    required this.title,
    required this.description,
    this.link,
    this.start,
    this.end,
  });
}
