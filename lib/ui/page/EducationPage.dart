import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/model/Education.dart';
import 'package:ezorrio_dev/resource/DataRepository.dart';
import 'package:ezorrio_dev/ui/widget/AppWidgets.dart';
import 'package:ezorrio_dev/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelines/timelines.dart';

class EducationPage extends StatelessWidget {
  static const routeName = '/education';

  const EducationPage({Key? key}) : super(key: key);

  static EducationPage instance() => const EducationPage();

  Widget projectItem(BuildContext context, Education education) =>
      AppWidgets.infoCard(
        context: context,
        title: education.place,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(education.occupation),
            Text(
              '${AppUtils.formatTime(education.start)} - ${AppUtils.formatTime(education.end)}',
              style: context.textStyleCaption,
            ),
            const SizedBox(height: 12),
            Text(education.description),
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
          contentsBuilder: (context, index) => projectItem(context,
              RepositoryProvider.of<DataRepository>(context).education[index]),
          nodePositionBuilder: (_, __) => 0,
          itemCount:
              RepositoryProvider.of<DataRepository>(context).education.length,
        ),
      );
}
