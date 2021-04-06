import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  static const routeName = '/projects';

  static ProjectsPage instance() => ProjectsPage();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        child: Text('$index'),
      ),
      itemCount: 100,
    );
  }
}
