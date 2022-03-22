import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/ui/widget/AppWidgets.dart';
import 'package:ezorrio_dev/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          'Briefly speaking, I\'m originally from Azerbaijan, but was born in Russia. \n\n'
          'Most of time I\'m coding, hiking, photographing and listening to music.',
          style: context.textStyleBody1,
        ),
      );

  Widget locationCard() => AppWidgets.infoCard(
        context: context,
        title: 'Location 📍',
        content: Text(
          '2021 - now: Oslo, Norway\n'
          '2019 - 2021: Vienna, Austria\n'
          '2010 - 2019: Moscow, Russia\n'
          '2006 - 2010: Nizhniy Novgorod, Russia',
          style: context.textStyleBody1,
        ),
      );

  Widget educationCard() => AppWidgets.infoCard(
        context: context,
        title: 'Education 🎓',
        content: Text(
          'Currently I study at University of Vienna, MSc Computer Science, Data Science field',
          style: context.textStyleBody1,
        ),
      );

  Widget workCard() => AppWidgets.infoCard(
        context: context,
        title: 'Work 🧰',
        content: Text(
          'Despite studying Data Science, I\'m more experienced as Application Developer. \n\n'
          'Have more than 5 years of experience with Android. \n\n'
          'Currently I work as a Lead Flutter Developer at wheel.me, on an cross-platform app for robots control',
          style: context.textStyleBody1,
        ),
      );

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: AppUtils.isCompact(context: context) ? 1 : 2,
          children: [
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: AppWidgets.conditionalPadding(
                  context: context, child: welcomeCard()),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: AppWidgets.conditionalPadding(
                  context: context, child: locationCard()),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: AppWidgets.conditionalPadding(
                  context: context, child: workCard()),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: AppWidgets.conditionalPadding(
                  context: context, child: educationCard()),
            ),
          ],
        ),
      );
}
