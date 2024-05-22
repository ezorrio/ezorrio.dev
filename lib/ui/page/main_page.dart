import 'package:ezorrio_dev/extensions.dart';
import 'package:ezorrio_dev/model/app_place.dart';
import 'package:ezorrio_dev/places.dart';
import 'package:ezorrio_dev/ui/page/projects_page.dart';
import 'package:ezorrio_dev/ui/page/work_page.dart';
import 'package:ezorrio_dev/ui/widget/profile_header.dart';
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
    Places.work: const WorkPage(),
    Places.projects: const ProjectsPage(),
    // if (kDebugMode) AppPlaces.schedule: const SchedulePage(),
  };

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: pages.length, vsync: this);
  }

  Widget bar() => Row(
        mainAxisSize: MainAxisSize.min,
        children: pages.keys
            .map((e) => Column(
                  children: [
                    TextButton(
                      onPressed: () => setState(() {
                        tabController.animateTo(
                          pages.keys.toList().indexOf(e),
                          duration: const Duration(milliseconds: 300),
                        );
                      }),
                      // icon: Icon(e.icon),
                      child: Text(e.title),
                    ),
                    if (e == pages.keys.elementAt(tabController.index))
                      Container(
                        height: 2,
                        width: 50,
                        color: context.primaryColor,
                      ),
                  ],
                ))
            .toList(growable: false),
      );

  Widget body() => DefaultTabController(
        initialIndex: 0,
        length: pages.length,
        // animationDuration: Duration.zero,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bar(),
            Expanded(child: pages.values.elementAt(tabController.index)),
          ],
        ),
      );

  Widget mobileLayout() => body();

  Widget desktopLayout() => Row(
        children: [
          const Spacer(),
          Expanded(
            flex: 3,
            child: body(),
          ),
          const Spacer(),
        ],
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: ProfileHeader(),
        ),
        body: AppUtils.isCompact(context: context) ? mobileLayout() : desktopLayout(),
      );
}
