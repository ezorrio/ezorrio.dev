import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/main.dart';
import 'package:ezorrio_dev/model/AppPlace.dart';
import 'package:ezorrio_dev/resource/DataRepository.dart';
import 'package:ezorrio_dev/ui/widget/AppWidgets.dart';
import 'package:ezorrio_dev/ui/widget/ProfileHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuWidget extends StatefulWidget {
  final bool isCompact;
  final List<AppPlace> pageList;
  final AppPlace? currentPage;

  const MenuWidget(
      {required this.isCompact,
      required this.pageList,
      required this.currentPage,
      Key? key})
      : super(key: key);

  @override
  MenuWidgetState createState() => MenuWidgetState();
}

class MenuWidgetState extends State<MenuWidget> {
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
      InkWell(
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
              const SizedBox(width: 8),
              Text(
                pageToOpen.title,
                style: context.textStyleBody1
                    .copyWith(color: isActive ? context.additionalColor : null),
              ),
            ],
          ),
        ),
      );

  Widget mainDrawerCompact() =>
      AppWidgets.conditionalPadding(
        context: context,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileHeader(
                isCompact: widget.isCompact,
                name: RepositoryProvider.of<DataRepository>(context).name,
                bio: RepositoryProvider.of<DataRepository>(context).bio,
                photoUrl: RepositoryProvider.of<DataRepository>(context).photo,
                nickname:
                    RepositoryProvider.of<DataRepository>(context).nickname,
                networkLinks:
                    RepositoryProvider.of<DataRepository>(context).networkLinks,
              ),
              LimitedBox(
                maxHeight: 48,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection:
                        widget.isCompact ? Axis.horizontal : Axis.vertical,
                    itemCount: widget.pageList.length,
                    itemBuilder: (_, item) => _drawerItemCompact(
                        pageToOpen: widget.pageList[item],
                        isActive: widget.currentPage == widget.pageList[item])),
              ),
            ],
          ),
        ),
      );

  Widget mainDrawer() => Column(
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
          const SizedBox(height: 8),
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
      widget.isCompact ? mainDrawerCompact() : mainDrawer();
}
