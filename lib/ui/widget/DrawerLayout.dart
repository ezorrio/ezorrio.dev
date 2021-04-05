import 'package:ezorrio_dev/Constants.dart';
import 'package:ezorrio_dev/Places.dart';
import 'package:ezorrio_dev/bloc/navigation/NavigationBloc.dart';
import 'package:ezorrio_dev/main.dart';
import 'package:ezorrio_dev/model/AppPlace.dart';
import 'package:ezorrio_dev/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'AppDrawer.dart';

class DrawerLayout extends StatefulWidget {
  final Widget child;

  DrawerLayout({required this.child});

  @override
  State<StatefulWidget> createState() => DrawerLayoutState();
}

class DrawerLayoutState extends State<DrawerLayout> {
  List<AppPlace> get menuContent =>
      [Places.INTRO, Places.EDUCATION, Places.WORK, Places.PROJECTS];

  Widget mobileLayout({required AppPlace? page}) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 250),
              child: drawer(isCompact: true, page: page)),
          Expanded(child: widget.child),
        ],
      );

  Widget drawer({required bool isCompact, required AppPlace? page}) => SafeArea(
        child: LimitedBox(
          maxWidth: Constants.DESKTOP_MENU_SIZE,
          child: AppDrawer(
              isCompact: isCompact, pageList: menuContent, currentPage: page),
        ),
      );

  Widget desktopLayout({required AppPlace? page}) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            drawer(isCompact: false, page: page),
            Flexible(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(maxWidth: Constants.DESKTOP_MENU_SIZE * 2),
                child: widget.child,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<NavigationBloc, NavigationState>(
        builder: (_, state) => WillPopScope(
          onWillPop: () async {
            if (Navigator.of(App.navigatorKey.currentContext!).canPop()) {
              await Navigator.of(App.navigatorKey.currentContext!).maybePop();
              return false;
            }
            if (Navigator.of(context).canPop()) {
              await Navigator.of(context).maybePop();
              return false;
            }
            return true;
          },
          child: Stack(children: [
            Positioned.fill(
              child: Image.asset(
                AppUtils.isSystemLight ? 'drawable/background_light.png': 'drawable/background_dark.png',
                filterQuality: FilterQuality.high,
                repeat: ImageRepeat.repeat,
              ),
            ),
            AppUtils.isCompact(context: context)
                ? mobileLayout(page: state.currentPage)
                : desktopLayout(page: state.currentPage),
          ]),
        ),
      );
}
