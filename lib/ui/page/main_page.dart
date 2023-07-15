import 'package:ezorrio_dev/constants.dart';
import 'package:ezorrio_dev/extensions.dart';
import 'package:ezorrio_dev/model/app_place.dart';
import 'package:ezorrio_dev/places.dart';
import 'package:ezorrio_dev/ui/page/intro_page.dart';
import 'package:ezorrio_dev/ui/page/projects_page.dart';
import 'package:ezorrio_dev/ui/page/work_page.dart';
import 'package:ezorrio_dev/utils/app_utils.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

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
            // AppBar(title: Text(pages.keys.elementAt(tabController.index).title)),
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
                        margin: EdgeInsets.zero,
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
          child: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IntroPage(),
                        ProjectsPage(),
                      ],
                    ),
                  ),
                  Expanded(flex: 3, child: WorkPage()),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => AppUtils.isCompact(context: context) ? mobileLayout() : desktopLayout();
}
