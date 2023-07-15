import 'package:ezorrio_dev/extensions.dart';
import 'package:ezorrio_dev/model/education.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';
import 'package:ezorrio_dev/ui/widget/app_card.dart';
import 'package:ezorrio_dev/ui/widget/conditional_padding.dart';
import 'package:ezorrio_dev/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationPage extends StatelessWidget {
  static const routeName = '/education';

  const EducationPage({super.key});

  static EducationPage instance() => const EducationPage();

  Widget projectItem(BuildContext context, Education education) => ConditionalPadding(
        needPadding: AppUtils.isCompact(context: context),
        child: AppCard(
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
        ),
      );

  @override
  Widget build(BuildContext context) => ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, index) =>
            projectItem(context, RepositoryProvider.of<DataRepository>(context).education[index]),
        itemCount: RepositoryProvider.of<DataRepository>(context).education.length,
      );
}
