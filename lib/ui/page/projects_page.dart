import 'package:ezorrio_dev/extensions.dart';
import 'package:ezorrio_dev/model/project.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';
import 'package:ezorrio_dev/ui/widget/app_widgets.dart';
import 'package:ezorrio_dev/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsPage extends StatelessWidget {
  static const routeName = '/projects';

  const ProjectsPage({super.key});

  static ProjectsPage instance() => const ProjectsPage();

  Widget projectItem(BuildContext context, Project project) => AppWidgets.conditionalPadding(
        context: context,
        child: AppWidgets.infoCard(
          context: context,
          title: project.title,
          link: project.link,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppUtils.formatTime(project.start)} - ${AppUtils.formatTime(project.end)}',
                style: context.textStyleCaption,
              ),
              const SizedBox(height: 12),
              Text(
                project.description,
                style: context.textStyleBody1,
              ),
              const SizedBox(height: 12),
              Wrap(children: [
                ...project.tags.map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Chip(label: Text(e, style: context.textStyleCaption)),
                  ),
                )
              ]),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, index) => projectItem(context, RepositoryProvider.of<DataRepository>(context).projects[index]),
        itemCount: RepositoryProvider.of<DataRepository>(context).projects.length,
      );
}
