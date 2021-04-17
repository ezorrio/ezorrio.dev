import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/main.dart';
import 'package:ezorrio_dev/model/AppPlace.dart';
import 'package:ezorrio_dev/resource/DataRepository.dart';
import 'package:ezorrio_dev/ui/widget/ProfileHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatefulWidget {
  final bool isCompact;
  final List<AppPlace> pageList;
  final AppPlace? currentPage;

  AppDrawer(
      {required this.isCompact,
      required this.pageList,
      required this.currentPage});

  @override
  AppDrawerState createState() => AppDrawerState();
}

class AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
  }

  Widget _drawerItem({required AppPlace pageToOpen, bool isActive = false}) =>
      ListTile(
          leading: Icon(
            pageToOpen.icon,
            color: isActive ? context.additionalColor : null,
            size: 24,
          ),
          title: Text(
            pageToOpen.title,
            style: context.textStyleBody1
                .copyWith(color: isActive ? context.additionalColor : null),
          ),
          onTap: () => App.navigatorKey.currentState!
              .pushNamedAndRemoveUntil(pageToOpen.routeName, (route) => false));

  Widget _drawerItemCompact(
          {required AppPlace pageToOpen, bool isActive = false}) =>
      GestureDetector(
        onTap: () => App.navigatorKey.currentState!
            .pushNamedAndRemoveUntil(pageToOpen.routeName, (route) => false),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                pageToOpen.icon,
                color: isActive ? context.additionalColor : null,
                size: 24,
              ),
              SizedBox(width: 8),
              Text(
                pageToOpen.title,
                style: context.textStyleBody1
                    .copyWith(color: isActive ? context.additionalColor : null),
              ),
            ],
          ),
        ),
      );

  Widget mainDrawerCompact(BuildContext context) => Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfileHeader(
              isCompact: widget.isCompact,
              name: RepositoryProvider.of<DataRepository>(context).name,
              bio: RepositoryProvider.of<DataRepository>(context).bio,
              photoUrl: RepositoryProvider.of<DataRepository>(context).photo,
              nickname: RepositoryProvider.of<DataRepository>(context).nickname,
              networkLinks:
                  RepositoryProvider.of<DataRepository>(context).networkLinks,
            ),
            LimitedBox(
              maxHeight: 40,
              child: ListView.builder(
                  scrollDirection:
                      widget.isCompact ? Axis.horizontal : Axis.vertical,
                  itemCount: widget.pageList.length,
                  itemBuilder: (_, item) => _drawerItemCompact(
                      pageToOpen: widget.pageList[item],
                      isActive: widget.currentPage == widget.pageList[item])),
            ),
          ],
        ),
      );

  Widget mainDrawer(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ProfileHeader(
            isCompact: widget.isCompact,
            name: RepositoryProvider.of<DataRepository>(context).name,
            bio: RepositoryProvider.of<DataRepository>(context).bio,
            photoUrl: RepositoryProvider.of<DataRepository>(context).photo,
            nickname: RepositoryProvider.of<DataRepository>(context).nickname,
            networkLinks:
                RepositoryProvider.of<DataRepository>(context).networkLinks,
          ),
          SizedBox(height: 8),
          Card(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection:
                  widget.isCompact ? Axis.horizontal : Axis.vertical,
              itemCount: widget.pageList.length,
              itemBuilder: (_, item) => _drawerItem(
                  pageToOpen: widget.pageList[item],
                  isActive: widget.currentPage == widget.pageList[item]),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) =>
      widget.isCompact ? mainDrawerCompact(context) : mainDrawer(context);
}
