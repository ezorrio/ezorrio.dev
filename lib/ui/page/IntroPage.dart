import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/ui/widget/AppWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class IntroPage extends StatefulWidget {
  static const routeName = '/intro';

  static IntroPage instance() => IntroPage();

  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  Widget welcomeCard() => AppWidgets.infoCard(
        context: context,
        title: 'Introduction',
        content: Text(
          'Briefly speaking, I\'m originally from Azerbaijan, was born in Russia. \n\n'
          'Most of time I\'m coding, hiking, photographing and listening to music.',
          style: context.textStyleBody1,
        ),
      );

  Widget locationCard() => AppWidgets.infoCard(
        context: context,
        title: 'Location',
        content: Column(
          children: [
            Text(
                'I\'ve moved to Vienna, Austria in late 2019 and since then live there'),
            SizedBox(height: 16),
            Image.network(
                'https://photos.google.com/share/AF1QipNGy_k4gpCwzttVbUIyR2U1HDfm6MPqJJEijo2EDd5H-TQcYC2Yeh5_yGH7TFdTGw/photo/AF1QipM2K47MxmKfcZUnWbWlXtomqqRNKXiFrK_ncDw8?key=c0ZZcmJ3cVFBQlFBdzBobzl0R3dqZDBUbDZ1S3hn'),
          ],
        ),
      );

  Widget educationCard() => AppWidgets.infoCard(
        context: context,
        title: 'Education',
        content: Column(
          children: [
            Text(
              'Currently I study at University of Vienna, MSc Computer Science, Data Science field',
              style: context.textStyleBody1,
            ),
            SizedBox(height: 16),
            Image.network(
                'https://datascience.univie.ac.at/fileadmin/_processed_/csm_14520043908_6c16baa2c2_k_5ed7f190ee.jpg'),
          ],
        ),
      );

  Widget workCard() => AppWidgets.infoCard(
        context: context,
        title: 'Work',
        content: Column(
          children: [
            Text(
              'Despite studying Data Science, I\'m more experienced as Application Developer. \n\n'
              'Have more than 5 years of experience with Android. \n\n'
              'Currently I work as a Lead Flutter Developer at wheel.me, on an cross-platform app for robots control',
              style: context.textStyleBody1,
            ),
            SizedBox(height: 16),
            Image.network(
                'https://static.wixstatic.com/media/6de112_fb65ca1fdb794b07a8986d8428321e07~mv2.jpg/v1/fill/w_117,h_45,al_c,q_80,usm_0.66_1.00_0.01/Wheelme_rgb.jpg'),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => StaggeredGridView.count(
        crossAxisCount: 2,
        staggeredTiles: [
          const StaggeredTile.count(1, 1),
          const StaggeredTile.count(1, 1),
          const StaggeredTile.count(2, 2),
          const StaggeredTile.count(2, 1.5),
        ],
        children: [
          welcomeCard(),
          locationCard(),
          educationCard(),
          workCard(),
        ],
      );
}
