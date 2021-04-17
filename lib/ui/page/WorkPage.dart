import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/model/Project.dart';
import 'package:ezorrio_dev/model/Work.dart';
import 'package:ezorrio_dev/resource/DataRepository.dart';
import 'package:ezorrio_dev/ui/widget/AppWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

class WorkPage extends StatelessWidget {
  static const routeName = '/work';

  static WorkPage instance() => WorkPage();

  String formatTime(DateTime? time) => time != null
      ? time == DateTime.now()
          ? 'Today'
          : DateFormat('yyyy/MM').format(time)
      : '?';

  Widget projectItem(BuildContext context, Project project) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: context.textStyleBody1.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(project.description),
        ],
      );

  Widget workItem(BuildContext context, Work work) => AppWidgets.infoCard(
        context: context,
        title: work.company,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${work.position} (${formatTime(work.start!)} - ${formatTime(work.end!)})',
            ),
            ...work.projects.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: projectItem(context, item),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => Timeline.tileBuilder(
        theme: TimelineThemeData(color: context.primaryColor),
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.basic,
          indicatorStyle: IndicatorStyle.outlined,
          connectorStyle: ConnectorStyle.dashedLine,
          contentsBuilder: (context, index) => workItem(context,
              RepositoryProvider.of<DataRepository>(context).works[index]),
          nodePositionBuilder: (_, __) => 0,
          itemCount:
              RepositoryProvider.of<DataRepository>(context).works.length,
        ),
      );
}
