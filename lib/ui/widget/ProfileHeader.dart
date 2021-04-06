import 'dart:math';

import 'package:ezorrio_dev/Constants.dart';
import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/Themes.dart';
import 'package:ezorrio_dev/ui/widget/SocialNetworks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'AnimatedWave.dart';

class ProfileHeader extends StatelessWidget {
  final bool isCompact;
  final String photoUrl;
  final String name;
  final String bio;
  final String nickname;

  ProfileHeader(
      {required this.isCompact,
      required this.name,
      required this.bio,
      required this.photoUrl,
      required this.nickname});

  Widget _onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );

  Widget profile(BuildContext context) => isCompact
      ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipOval(
              child: Image.network(
                photoUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(name, style: context.textStyleTitle),
                // SizedBox(height: 4),
                Text('@$nickname', style: context.textStyleCaption),
                SizedBox(height: 8),
                Text(bio, style: context.textStyleCaption),
                SizedBox(height: 4),
                SocialNetworks(
                    twitter: SocialNetworkLinks.TWITTER,
                    instagram: SocialNetworkLinks.INSTAGRAM,
                    facebook: SocialNetworkLinks.FACEBOOK,
                    telegram: SocialNetworkLinks.TELEGRAM,
                    linkedin: SocialNetworkLinks.LINKEDIN,
                    github: SocialNetworkLinks.GITHUB,
                    email: SocialNetworkLinks.EMAIL),
              ],
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
            SizedBox(height: 4),
            Text(name, style: context.textStyleTitle),
            SizedBox(height: 8),
            Text('@$nickname', style: context.textStyleBody1),
            SizedBox(height: 8),
            Text(bio, style: context.textStyleCaption),
            SizedBox(height: 8),
            SocialNetworks(
                twitter: SocialNetworkLinks.TWITTER,
                instagram: SocialNetworkLinks.INSTAGRAM,
                facebook: SocialNetworkLinks.FACEBOOK,
                telegram: SocialNetworkLinks.TELEGRAM,
                linkedin: SocialNetworkLinks.LINKEDIN,
                github: SocialNetworkLinks.GITHUB,
                email: SocialNetworkLinks.EMAIL)
          ],
        );

  Widget waves(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
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
                  padding: EdgeInsets.symmetric(vertical: isCompact ? 8 : 12),
                  child: profile(context)),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => waves(context);
}
