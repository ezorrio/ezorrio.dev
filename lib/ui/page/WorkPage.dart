import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/model/Project.dart';
import 'package:ezorrio_dev/model/Work.dart';
import 'package:ezorrio_dev/resource/DataRepository.dart';
import 'package:ezorrio_dev/ui/widget/AppWidgets.dart';
import 'package:ezorrio_dev/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkPage extends StatelessWidget {
  static const routeName = '/work';

  const WorkPage({Key? key}) : super(key: key);

  static WorkPage instance() => const WorkPage();

  Widget projectItem(BuildContext context, Project project) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: context.textStyleBody1.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(project.description),
          const SizedBox(height: 12),
          Wrap(
            children: [
              ...project.tags.map(
                (e) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Chip(label: Text(e, style: context.textStyleCaption)),
                ),
              ),
            ],
          ),
        ],
      );

  Widget workItem(BuildContext context, Work work) =>
      AppWidgets.conditionalPadding(
        context: context,
        child: AppWidgets.infoCard(
          context: context,
          title: work.company,
          link: work.link,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(work.position),
              Text(
                '${AppUtils.formatTime(work.start)} - ${AppUtils.formatTime(work.end)}',
                style: context.textStyleCaption,
              ),
              ...work.projects.map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: projectItem(context, item),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemBuilder: (_, index) => workItem(context,
            RepositoryProvider.of<DataRepository>(context).works[index]),
        itemCount: RepositoryProvider.of<DataRepository>(context).works.length,
      );
}
