import 'dart:math';

import 'package:ezorrio_dev/Constants.dart';
import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/Themes.dart';
import 'package:ezorrio_dev/main.dart';
import 'package:ezorrio_dev/model/AppPlace.dart';
import 'package:ezorrio_dev/ui/widget/ProfileHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AnimatedWave.dart';

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

  Widget _onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );

  Widget _header(BuildContext context) => Stack(
        clipBehavior: Clip.antiAlias,
        children: <Widget>[
          _onBottom(AnimatedWave(
            height: 20,
            speed: 1.0,
            color: AppColors.primary,
          )),
          _onBottom(AnimatedWave(
            height: 60,
            speed: 0.9,
            offset: pi,
            color: AppColors.primary,
          )),
          _onBottom(AnimatedWave(
            height: 40,
            speed: 1.2,
            offset: pi / 2,
            color: AppColors.primary,
          )),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ProfileHeader(
                widget.isCompact,
                Constants.NAME,
                Constants.BIO,
                Constants.PHOTO,
              ),
            ),
          ),
        ],
      );

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

  Widget mainDrawerCompact(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            borderOnForeground: true,
            child: _header(context),
          ),
          SizedBox(height: 8),
          LimitedBox(
            maxHeight: 64,
            child: Card(
              child: ListView.builder(
                  scrollDirection:
                      widget.isCompact ? Axis.horizontal : Axis.vertical,
                  itemCount: widget.pageList.length,
                  itemBuilder: (_, item) => _drawerItemCompact(
                      pageToOpen: widget.pageList[item],
                      isActive: widget.currentPage == widget.pageList[item])),
            ),
          ),
        ],
      );

  Widget mainDrawer(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Card(
            borderOnForeground: true,
            child: _header(context),
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
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text(
                'Powered by Flutter',
                style: context.textStyleCaption,
              ),
              onTap: () async => await canLaunch(Constants.FLUTTER_URL)
                  ? await launch(Constants.FLUTTER_URL)
                  : throw 'Could not launch ${Constants.FLUTTER_URL}',
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) =>
      widget.isCompact ? mainDrawerCompact(context) : mainDrawer(context);
}
