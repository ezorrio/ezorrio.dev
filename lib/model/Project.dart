class Project {
  String title;
  String description;
  DateTime? start;
  DateTime? end;
  String? link;
  List<String> tags;

  Project({
    required this.title,
    required this.description,
    required this.tags,
    this.link,
    this.start,
    this.end,
  });
}
