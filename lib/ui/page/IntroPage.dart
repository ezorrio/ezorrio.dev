import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/resource/DataRepository.dart';
import 'package:ezorrio_dev/ui/widget/AppWidgets.dart';
import 'package:ezorrio_dev/ui/widget/ProfileHeader.dart';
import 'package:ezorrio_dev/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class IntroPage extends StatefulWidget {
  static const routeName = '/intro';

  const IntroPage({Key? key}) : super(key: key);

  static IntroPage instance() => const IntroPage();

  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  Widget welcomeCard() => AppWidgets.infoCard(
        context: context,
        title: 'About me 🐰',
        content: Text(
          'Senior Application Developer with leading experience\n\n'
          'From Azerbaijan 🇦🇿, born in Russia 🇷🇺',
          style: context.textStyleBody1,
        ),
      );

  Widget locationCard() => AppWidgets.infoCard(
        context: context,
        title: 'Location 📍',
        content: Text(
          '2021 - now: Oslo, Norway 🇳🇴 \n'
          '2019 - 2021: Vienna, Austria 🇦🇹\n'
          '2010 - 2019: Moscow, Russia 🇷🇺',
          style: context.textStyleBody1,
        ),
      );

  Widget educationCard() => AppWidgets.infoCard(
        context: context,
        title: 'Education 🎓',
        content: Text(
          'MSc Computer Science, Data Science [ongoing] \n@University of Vienna\n\n'
          'BSc Applied Mathematics and Informatics \n@Moscow Power Engineering Institute',
          style: context.textStyleBody1,
        ),
      );

  Widget workCard() => AppWidgets.infoCard(
        context: context,
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
