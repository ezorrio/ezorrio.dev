import 'package:ezorrio_dev/Constants.dart';
import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/Places.dart';
import 'package:ezorrio_dev/model/AppPlace.dart';
import 'package:ezorrio_dev/resource/DataRepository.dart';
import 'package:ezorrio_dev/ui/page/IntroPage.dart';
import 'package:ezorrio_dev/ui/page/ProjectsPage.dart';
import 'package:ezorrio_dev/ui/page/WorkPage.dart';
import 'package:ezorrio_dev/ui/widget/ProfileHeader.dart';
import 'package:ezorrio_dev/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController tabController;

  final Map<AppPlace, Widget> pages = {
    Places.intro: const IntroPage(),
    Places.work: const WorkPage(),
    Places.projects: const ProjectsPage(),
    // if (kDebugMode) AppPlaces.schedule: const SchedulePage(),
  };

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: pages.length, vsync: this);
  }

  Widget mobileLayout() => DefaultTabController(
        initialIndex: 0,
        length: pages.length,
        // animationDuration: Duration.zero,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AppBar(title: Text(pages.keys.elementAt(tabController.index).title)),
            Expanded(child: pages.values.elementAt(tabController.index)),
            BottomNavigationBar(
              enableFeedback: false,
              type: BottomNavigationBarType.shifting,
              useLegacyColorScheme: false,
              landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
              currentIndex: tabController.index,
              onTap: (index) => setState(() {
                tabController.index = index;
              }),
              showUnselectedLabels: false,
              showSelectedLabels: false,
              selectedItemColor: context.primaryColor,
              items: pages.keys
                  .map((e) => BottomNavigationBarItem(
                      icon: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(e.icon),
                              if (e == pages.keys.elementAt(tabController.index)) ...[
                                const SizedBox(width: 8.0),
                                Text(
                                  e.title,
                                  style: context.textStyleBody1.copyWith(color: context.primaryColor),
                                ),
                              ]
                            ],
                          ),
                        ),
                      ),
                      label: ''))
                  .toList(growable: false),
            ),
          ],
        ),
      );

  Widget desktopLayout() => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(width: 5 * Constants.desktopMenuSize),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            IntroPage(),
                            ProjectsPage(),
                          ],
                        ),
                      ),
                      const Expanded(flex: 3, child: WorkPage()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => AppUtils.isCompact(context: context) ? mobileLayout() : desktopLayout();
}
