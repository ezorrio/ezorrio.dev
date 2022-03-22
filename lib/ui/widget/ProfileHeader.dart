import 'dart:math';

import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/Themes.dart';
import 'package:ezorrio_dev/resource/DataRepository.dart';
import 'package:ezorrio_dev/ui/widget/AppWidgets.dart';
import 'package:ezorrio_dev/ui/widget/SocialNetworks.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final bool isCompact;
  final String photoUrl;
  final String name;
  final String bio;
  final String nickname;
  final SocialNetworkLinks networkLinks;

  const ProfileHeader(
      {required this.isCompact,
      required this.name,
      required this.bio,
      required this.photoUrl,
      required this.nickname,
      required this.networkLinks,
      Key? key})
      : super(key: key);

  Widget _onCorner(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.topRight,
          child: child,
        ),
      );

  Widget profile(BuildContext context) => isCompact
      ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.network(
                  photoUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: context.textStyleTitle),
                  // SizedBox(height: 4),
                  Text('@$nickname', style: context.textStyleCaption),
                  const SizedBox(height: 8),
                  Text(bio, style: context.textStyleCaption),
                  const SizedBox(height: 4),
                  SocialNetworks(
                      twitter: networkLinks.twitter,
                      instagram: networkLinks.instagram,
                      facebook: networkLinks.facebook,
                      telegram: networkLinks.telegram,
                      linkedin: networkLinks.linkedin,
                      github: networkLinks.github,
                      email: networkLinks.email),
                ],
              ),
            ),
          ],
        )
      : Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: Image.network(
                photoUrl,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            Text(name, style: context.textStyleTitle),
            const SizedBox(height: 8),
            Text('@$nickname', style: context.textStyleBody1),
            const SizedBox(height: 8),
            Text(bio, style: context.textStyleCaption),
            const SizedBox(height: 8),
            SocialNetworks(
                twitter: networkLinks.twitter,
                instagram: networkLinks.instagram,
                facebook: networkLinks.facebook,
                telegram: networkLinks.telegram,
                linkedin: networkLinks.linkedin,
                github: networkLinks.github,
                email: networkLinks.email),
          ],
        );

  Widget waves(BuildContext context) => Stack(
        children: <Widget>[
          Positioned.fill(child: AppWidgets.appBackground(context: context)),
          _onCorner(IconButton(
            icon: const Icon(Icons.bedtime_outlined, size: 16),
            onPressed: () => showModalBottomSheet<void>(
                context: context,
                builder: (builder) =>
                    AppWidgets.themeChooser(context: context)),
          )),
          Center(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: isCompact ? 8 : 12),
                child: profile(context)),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) => isCompact
      ? waves(context)
      : Card(
          clipBehavior: Clip.antiAlias,
          child: waves(context),
        );
}
