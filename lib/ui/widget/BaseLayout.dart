import 'package:ezorrio_dev/Constants.dart';
import 'package:ezorrio_dev/Places.dart';
import 'package:ezorrio_dev/bloc/navigation/NavigationBloc.dart';
import 'package:ezorrio_dev/model/AppPlace.dart';
import 'package:ezorrio_dev/ui/widget/Cookies.dart';
import 'package:ezorrio_dev/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'MenuWidget.dart';

class BaseLayout extends StatefulWidget {
  final Widget child;

  const BaseLayout({required this.child, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BaseLayoutState();
}

class BaseLayoutState extends State<BaseLayout> {
  List<AppPlace> get menuContent =>
      [Places.intro, Places.education, Places.work, Places.projects];

  Widget mobileLayout({required AppPlace? page}) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          drawer(isCompact: true, page: page),
          Expanded(child: widget.child),
        ],
      );

  Widget drawer({required bool isCompact, required AppPlace? page}) => SafeArea(
        child: LimitedBox(
          maxWidth: Constants.desktopMenuSize,
          child: MenuWidget(
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
                constraints: const BoxConstraints(
                    maxWidth: Constants.desktopMenuSize * 2),
                child: widget.child,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned.fill(
            child: Cookies(
              isDark: AppUtils.isSystemLight(context: context),
            ),
          ),
          BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) => Column(
              children: [
                AppUtils.isCompact(context: context)
                    ? mobileLayout(page: state.currentPage)
                    : desktopLayout(page: state.currentPage),
              ],
            ),
          )
        ],
      );
}
