import 'package:ezorrio_dev/extensions.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';
import 'package:ezorrio_dev/ui/widget/app_card.dart';
import 'package:ezorrio_dev/ui/widget/profile_header.dart';
import 'package:ezorrio_dev/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class IntroPage extends StatefulWidget {
  static const routeName = '/intro';

  const IntroPage({super.key});

  static IntroPage instance() => const IntroPage();

  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  Widget welcomeCard() => AppCard(
        title: 'About me 🐰',
        content: Text(
          'Senior Application Developer with leading experience\n\n'
          'From Azerbaijan 🇦🇿, born in Russia 🇷🇺',
          style: context.textStyleBody1,
        ),
      );

  Widget locationCard() => AppCard(
        title: 'Location 📍',
        content: Text(
          '2021 - now: Oslo, Norway 🇳🇴 \n'
          '2019 - 2021: Vienna, Austria 🇦🇹\n'
          '2010 - 2019: Moscow, Russia 🇷🇺',
          style: context.textStyleBody1,
        ),
      );

  Widget educationCard() => AppCard(
        title: 'Education 🎓',
        content: Text(
          'MSc Computer Science, Data Science [ongoing] \n@University of Vienna\n\n'
          'BSc Applied Mathematics and Informatics \n@Moscow Power Engineering Institute',
          style: context.textStyleBody1,
        ),
      );

  Widget workCard() => AppCard(
        title: 'Work 🧰',
        content: Text(
          'Experienced in Flutter (>4 years). \n\n'
          'Have >5 years of experience with Android Native. \n\n'
          'Currently I work as a Senior Mobile Application Developer at Coop Norge',
          style: context.textStyleBody1,
        ),
      );

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: AppUtils.isCompact(context: context) ? const EdgeInsets.symmetric(horizontal: 16.0) : EdgeInsets.zero,
        child: StaggeredGrid.count(
          crossAxisCount: AppUtils.isCompact(context: context) ? 1 : 2,
          children: [
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: ProfileHeader(
                name: RepositoryProvider.of<DataRepository>(context).name,
                bio: RepositoryProvider.of<DataRepository>(context).bio,
                photoUrl: RepositoryProvider.of<DataRepository>(context).photo,
                nickname: RepositoryProvider.of<DataRepository>(context).nickname,
                networkLinks: RepositoryProvider.of<DataRepository>(context).networkLinks,
              ),
            ),
            StaggeredGridTile.fit(crossAxisCellCount: 1, child: welcomeCard()),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: locationCard(),
            ),
            StaggeredGridTile.fit(crossAxisCellCount: 1, child: workCard()),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: educationCard(),
            ),
          ],
        ),
      );
}
